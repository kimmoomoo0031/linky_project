import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/constants/lounge_create_constants.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/features/lounge/presentation/lounge_dialog_event_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_create_state.dart';

/// ラウンジ作成フォームの入力値・バリデーション・画像選択状態を管理するコントローラ。
class LoungeCreateController extends StateNotifier<LoungeCreateState> {
  LoungeCreateController(this._ref) : super(const LoungeCreateState());

  final Ref _ref;
  final ImagePicker _picker = ImagePicker();

  void onNameChanged(String value) {
    state = state.copyWith(name: value, nameError: null);
  }

  void onDescriptionChanged(String value) {
    state = state.copyWith(description: value, descriptionError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(loungeCreateDialogEventProvider.notifier).state = event;
  }

  /// 画像を選択 → 1次検証 → 1:1クロップ → サムネ生成（256px）まで行う。
  Future<void> pickCoverImage() async {
    // 1) 画像選択（ギャラリー）
    // 以前のエラーメッセージをクリアしておく
    state = state.copyWith(coverImageError: null);
    final xfile = await _picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;

    final bytes = await xfile.readAsBytes();
    if (bytes.lengthInBytes > LoungeCreateConstants.maxUploadBytes) {
      state = state.copyWith(
        coverImageError:
            'ファイルサイズが大きすぎます（最大${LoungeCreateConstants.maxUploadMb}MB）',
      );
      return;
    }

    // 2) 1次検証（実体判定: バイトからデコーダを特定）
    // - 拡張子は信頼できない（例: .jpg でも中身が HEIC / WebP など）
    // - 「処理可能かどうか」はバイトを見て判定する
    final decoder = img.findDecoderForData(bytes);
    if (decoder == null) {
      state = state.copyWith(
        coverImageError: '対応していない画像形式です（JPG/PNGのみ）',
      );
      return;
    }

    final isPng = decoder is img.PngDecoder;
    final isJpg = decoder is img.JpegDecoder;
    if (!isPng && !isJpg) {
      state = state.copyWith(
        coverImageError: '対応していない画像形式です（JPG/PNGのみ）',
      );
      return;
    }

    // 3) 1次検証（最小解像度）
    // ※ decoder は存在するが、念のため decodeImage の結果も確認する
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      state = state.copyWith(
        coverImageError:
            '画像を読み込めませんでした。ファイルが壊れているか、対応外の形式の可能性があります。別の画像を選択してください（JPG/PNGのみ）。',
      );
      return;
    }
    if (decoded.width < LoungeCreateConstants.minSidePx ||
        decoded.height < LoungeCreateConstants.minSidePx) {
      state = state.copyWith(
        coverImageError:
            '画像サイズが小さすぎます（${LoungeCreateConstants.minSidePx}px以上推奨）',
      );
      return;
    }

    // 4) ユーザーが 1:1 でトリミング（アイコン用の構図調整）
    final cropped = await ImageCropper().cropImage(
      sourcePath: xfile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: isPng ? ImageCompressFormat.png : ImageCompressFormat.jpg,
      // PNG の場合は quality が効かないが、型の都合で固定値を渡す
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '画像を調整',
          lockAspectRatio: true,
          hideBottomControls: false,
        ),
        IOSUiSettings(
          title: '画像を調整',
          aspectRatioLockEnabled: true,
        ),
      ],
    );
    if (cropped == null) return;

    final croppedBytes = await cropped.readAsBytes();
    final croppedDecoded = img.decodeImage(croppedBytes);
    if (croppedDecoded == null) {
      state = state.copyWith(
        coverImageError:
            'トリミング後の画像を読み込めませんでした。もう一度やり直すか、別の画像を選択してください。',
      );
      return;
    }

    // 5) サムネ生成（256x256）
    final thumb = img.copyResize(
      croppedDecoded,
      width: LoungeCreateConstants.thumbSizePx,
      height: LoungeCreateConstants.thumbSizePx,
      interpolation: img.Interpolation.average,
    );
    final Uint8List thumbBytes = isPng
        ? Uint8List.fromList(img.encodePng(thumb))
        : Uint8List.fromList(img.encodeJpg(thumb, quality: 85));

    state = state.copyWith(
      originalImagePath: xfile.path,
      thumbnailBytes: thumbBytes,
      coverImageError: null,
    );
  }

  bool _validateAll() {
    final nameError = Validators.validateLoungeName(state.name);
    final descriptionError = Validators.validateLoungeDescription(state.description);

    if (nameError != null || descriptionError != null) {
      state = state.copyWith(
        nameError: nameError,
        descriptionError: descriptionError,
      );
      return false;
    }
    return true;
  }

  Future<void> submit() async {
    if (state.isSubmitting) return;
    if (!_validateAll()) return;

    state = state.copyWith(isSubmitting: true);
    try {
      // TODO(api): ラウンジ作成 API を呼び出し、成功したらラウンジ詳細へ遷移する。
      // TODO(api): バックエンドのエラーをフロントで分類して扱えるようにする（文字列ベタ出しを避ける）。
      //   - ネットワーク系（オフライン/タイムアウト等）: CommonDialogMessages.networkError を表示
      //   - サーバー系（5xx等）: CommonDialogMessages.serverError を表示
      //   - ビジネスエラー（例: ラウンジ名重複）: errorCode を解析して nameError 等のフィールドエラーに反映
      //   - バリデーションエラー（fieldErrors が返る場合）: 各フィールドにマッピング
      //   - 想定外: CommonDialogMessages.unexpectedError を表示
      // TODO(api): 可能なら UseCase/Result（例: CreateLoungeResult）を導入し、
      //   Controller は Result → UI(state/ダイアログ) のマッピングに専念させる。
      await Future<void>.delayed(const Duration(milliseconds: 400));
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.info,
          message: 'ラウンジを作成しました。',
        ),
      );
    } catch (_) {
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: 'エラーが発生しました。時間をおいて再度お試しください。',
        ),
      );
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}

final loungeCreateControllerProvider =
    StateNotifierProvider.autoDispose<LoungeCreateController, LoungeCreateState>(
  (ref) => LoungeCreateController(ref),
);


