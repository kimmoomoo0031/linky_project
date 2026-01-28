import 'dart:typed_data';
import 'dart:convert';

import 'package:characters/characters.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/lounge_constants.dart';
import 'package:linky_project_0318/core/debug/logged_action.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/widgets/feedback/dialogs.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/create_lounge_post_result.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/create_lounge_post_usecase.dart';
import 'package:linky_project_0318/features/lounge/presentation/lounge_dialog_event_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_post_create_state.dart';

class LoungePostCreateArgs {
  const LoungePostCreateArgs({
    required this.loungeId,
    required this.isGuest,
  });

  final int loungeId;
  final bool isGuest;

  @override
  bool operator ==(Object other) {
    return other is LoungePostCreateArgs &&
        other.loungeId == loungeId &&
        other.isGuest == isGuest;
  }

  @override
  int get hashCode => Object.hash(loungeId, isGuest);
}

/// ラウンジ投稿作成フォームの入力値・画像選択状態を管理するコントローラ。
class LoungePostCreateController extends StateNotifier<LoungePostCreateState> {
  LoungePostCreateController(
    this._ref,
    LoungePostCreateArgs args,
    this._useCase,
  )   : _loungeId = args.loungeId,
        super(LoungePostCreateState(isGuest: args.isGuest));

  final Ref _ref;
  final int _loungeId;
  final CreateLoungePostUseCase _useCase;

  String _contentDeltaJson = '';
  void onTitleChanged(String value) {
    state = state.copyWith(title: value, titleError: null);
  }

  void onContentChanged(String value) {
    state = state.copyWith(contentRaw: value, contentError: null);
  }

  void onQuillChanged({
    required String plainText,
    required String deltaJson,
  }) {
    _contentDeltaJson = deltaJson;
    state = state.copyWith(contentRaw: plainText, contentError: null);
  }

  void onGuestNicknameChanged(String value) {
    state = state.copyWith(guestNickname: value, guestNicknameError: null);
  }

  void onGuestPasswordChanged(String value) {
    state = state.copyWith(guestPassword: value, guestPasswordError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(loungePostCreateDialogEventProvider.notifier).state = event;
  }

  /// 画像を選択 → 検証 → 状態に追加する。
  Future<List<String>> pickImage(BuildContext context) async {
    final assets = await InstaAssetPicker.pickAssets(
      context,
      maxAssets: 50,
      requestType: RequestType.image,
      pickerConfig: const InstaAssetPickerConfig(
        closeOnComplete: true,
        skipCropOnComplete: true,
      ),
      onCompleted: (_) {},
    );
    if (assets == null || assets.isEmpty) return const [];

    final newBytes = <Uint8List>[];
    final newPaths = <String>[];

    for (final asset in assets) {
      final bytes = await asset.originBytes;
      final file = await asset.originFile;
      if (bytes == null || file == null) {
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.warning,
            message: CommonMessages.failures.loungePostImageDecodeFailed.message,
          ),
        );
        continue;
      }
      newBytes.add(bytes);
      newPaths.add(file.path);
    }

    if (newBytes.isEmpty) return const [];

    state = state.copyWith(
      attachedImageBytes: [...state.attachedImageBytes, ...newBytes],
      attachedImagePaths: [...state.attachedImagePaths, ...newPaths],
    );

    return newPaths;
  }

  String? _validateTitle(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return CommonMessages.failures.loungePostTitleRequired.message;
    }
    if (trimmed.characters.length > LoungeConstants.postTitleMaxLength) {
      return CommonMessages.failures.loungePostTitleTooLong.message;
    }
    return null;
  }

  String? _validateContent(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return CommonMessages.failures.loungePostContentRequired.message;
    }
    if (trimmed.characters.length > LoungeConstants.postContentMaxLength) {
      return CommonMessages.failures.loungePostContentTooLong.message;
    }
    return null;
  }

  String? _validateAll() {
    final guestNicknameError =
        state.isGuest ? Validators.validateNickname(state.guestNickname) : null;
    final guestPasswordError =
        state.isGuest ? Validators.validatePassword(state.guestPassword) : null;
    final titleError = _validateTitle(state.title);
    final contentError = _validateContent(state.contentRaw);

    state = state.copyWith(
      guestNicknameError: guestNicknameError,
      guestPasswordError: guestPasswordError,
      titleError: titleError,
      contentError: contentError,
    );

    return guestNicknameError ??
        guestPasswordError ??
        titleError ??
        contentError;
  }

  String _buildContentHtml() {
    // Quill Delta(JSON) を HTML（簡易）に変換する。
    // - テキストはそのまま（HTMLエスケープ）
    // - 画像はアップロード後に差し替え可能なプレースホルダを埋め込む
    //   例: <img src="__upload__:0" />
    //
    // まだバックエンド側の仕様が未確定でも、imagePaths と同じ順番で 0..N を割り当てれば
    // サーバー側で URL に置換しやすい。
    final deltaJson = _contentDeltaJson;
    if (deltaJson.isEmpty) {
      // Quill 未使用/初期状態のフォールバック
      return _escapeHtml(state.contentRaw.trim()).replaceAll('\n', '<br/>');
    }

    dynamic parsed;
    try {
      parsed = jsonDecode(deltaJson);
    } catch (_) {
      return _escapeHtml(state.contentRaw.trim()).replaceAll('\n', '<br/>');
    }

    if (parsed is! List) {
      return _escapeHtml(state.contentRaw.trim()).replaceAll('\n', '<br/>');
    }

    final buffer = StringBuffer();
    var imageIndex = 0;
    for (final op in parsed) {
      if (op is! Map) continue;
      final insert = op['insert'];
      if (insert is String) {
        buffer.write(_escapeHtml(insert).replaceAll('\n', '<br/>'));
        continue;
      }
      if (insert is Map && insert.containsKey('image')) {
        buffer.write('<img src="__upload__:$imageIndex" />');
        imageIndex++;
        continue;
      }
    }
    var html = buffer.toString().trim();

    // fleather 移行直後は本文内への画像 embed 挿入を未対応にしているため、
    // 画像が添付されているのに embed が無い場合は末尾にまとめてプレースホルダを付与する。
    final attachedCount = state.attachedImagePaths.length;
    if (attachedCount > 0 && imageIndex == 0) {
      final extra = StringBuffer();
      for (var i = 0; i < attachedCount; i++) {
        extra.write('<br/><img src="__upload__:$i" />');
      }
      html = (html + extra.toString()).trim();
    }

    return html;
  }

  String _escapeHtml(String input) {
    return input
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }

  Future<void> submit() async {
    return runLogged(
      feature: 'LOUNGE',
      action: 'post.create.submit',
      fields: {
        'loungeId': _loungeId,
        'titleLength': state.title.length,
        'contentLength': state.contentRaw.length,
        'imageCount': state.attachedImageCount,
        'isGuest': state.isGuest,
      },
      blockReason: () {
        if (state.isSubmitting) return 'isSubmitting';
        final validationMessage = _validateAll();
        if (validationMessage != null) {
          _emitDialog(
            LinkyDialogEvent(
              type: LinkyDialogType.warning,
              message: validationMessage,
            ),
          );
          return 'validation';
        }
        return null;
      },
      blockFields: () => {
        'titleError': state.titleError,
        'contentError': state.contentError,
        'guestNicknameError': state.guestNicknameError,
        'guestPasswordError': state.guestPasswordError,
      },
      run: () async {
        state = state.copyWith(isSubmitting: true);
        try {
          final result = await _useCase(
            loungeId: _loungeId,
            title: state.title.trim(),
            contentHtml: _buildContentHtml(),
            contentPlain: state.contentRaw.trim(),
            imagePaths: state.attachedImagePaths,
            guestNickname:
                state.isGuest ? state.guestNickname.trim() : null,
            guestPassword:
                state.isGuest ? state.guestPassword.trim() : null,
          );
          _handleResult(result);
        } finally {
          state = state.copyWith(isSubmitting: false);
        }
      },
      onException: (e, st) {
        state = state.copyWith(isSubmitting: false);
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.unexpected.message,
          ),
        );
      },
    );
  }

  void _handleResult(CreateLoungePostResult result) {
    result.when(
      success: (_) {
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.info,
            message: CommonMessages.success.loungePostCreated.message,
          ),
        );
      },
      validationError: (message) {
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.warning,
            message: message,
          ),
        );
      },
      networkError: () {
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.network.message,
          ),
        );
      },
      serverError: () {
        _emitDialog(
          LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.server.message,
          ),
        );
      },
    );
  }
}

