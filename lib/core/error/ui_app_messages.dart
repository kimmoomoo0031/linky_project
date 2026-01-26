import 'package:linky_project_0318/core/constants/lounge_constants.dart';

/// [Core/Error] アプリ全体で共通に使うメッセージ（ダイアログ/スナックバー両対応）。
class AppMessage {
  const AppMessage({
    required this.message,
    this.title,
  });

  final String message;
  final String? title;
}

/// [Core/Error] アプリ共通メッセージ一覧。
///
/// 例: `CommonMessages.errors.network.message`
class CommonMessages {
  const CommonMessages._();

  static const errors = _CommonErrorMessages();
  static const success = _CommonSuccessMessages();
  static const failures = _CommonFailureMessages();
}

/// [Core/Error] 共通：エラーメッセージ（ダイアログ/スナックバー用）
class _CommonErrorMessages {
  const _CommonErrorMessages();

  final network = const AppMessage(
    title: '通信エラー',
    message: 'ネットワークエラーが発生しました。\n通信状況を確認してから、もう一度お試しください。',
  );

  final server = const AppMessage(
    title: 'サーバーエラー',
    message: 'サーバーエラーが発生しました。\nしばらく時間をおいて再度お試しください。',
  );

  final unexpected = const AppMessage(
    title: 'エラー',
    message: '予期せぬエラーが発生しました。\nしばらく時間をおいて再度お試しください。',
  );

  final deleteFailed = const AppMessage(
    title: '削除失敗',
    message: '削除に失敗しました。もう一度お試しください。',
  );
}

/// [Core/Error] 共通：成功メッセージ（ダイアログ/スナックバー用）
class _CommonSuccessMessages {
  const _CommonSuccessMessages();

  /// [Core/Error] ラウンジ作成成功。
  final loungeCreated = const AppMessage(
    message: 'ラウンジを作成しました。',
  );

  /// [Core/Error] プロフィール更新成功。
  final profileUpdated = const AppMessage(
    message: 'プロフィールの編集が完了しました。',
  );

  /// [Lounge/PostCreate] 投稿作成成功。
  final loungePostCreated = const AppMessage(
    message: '投稿を作成しました。',
  );

  /// [Core/Error] 認証コード再送信成功。
  final resendResetCodeSucceeded = const AppMessage(
    message: '認証コードを再送信しました。',
  );
}

/// [Core/Error] 共通：失敗メッセージ（ダイアログ/スナックバー用）
class _CommonFailureMessages {
  const _CommonFailureMessages();

  /// [Lounge/Create] カバー画像のファイルサイズ超過。
  final loungeCoverImageTooLarge = const AppMessage(
    message: 'ファイルサイズが大きすぎます（最大${LoungeConstants.maxUploadMb}MB）',
  );

  /// [Lounge/Create] カバー画像の形式が未対応。
  final loungeCoverImageUnsupportedFormat = const AppMessage(
    message: '対応していない画像形式です（JPG/PNGのみ）',
  );

  /// [Lounge/Create] カバー画像の読み込み失敗。
  final loungeCoverImageDecodeFailed = const AppMessage(
    message:
        '画像を読み込めませんでした。ファイルが壊れているか、対応外の形式の可能性があります。別の画像を選択してください（JPG/PNGのみ）。',
  );

  /// [Lounge/Create] カバー画像の解像度不足。
  final loungeCoverImageTooSmall = const AppMessage(
    message:
        '画像サイズが小さすぎます（${LoungeConstants.coverImageMinRecommendedSidePx}px以上推奨）',
  );

  /// [Lounge/Create] トリミング後の画像読み込み失敗。
  final loungeCoverImageCropFailed = const AppMessage(
    message: 'トリミング後の画像を読み込めませんでした。もう一度やり直すか、別の画像を選択してください。',
  );

  /// [Lounge/PostCreate] 投稿画像のファイルサイズ超過。
  final loungePostImageTooLarge = const AppMessage(
    message:
        'ファイルサイズが大きすぎます（最大${LoungeConstants.postImageMaxUploadMb}MB）',
  );

  /// [Lounge/PostCreate] 投稿画像の形式が未対応。
  final loungePostImageUnsupportedFormat = const AppMessage(
    message: '対応していない画像形式です（JPG/PNGのみ）',
  );

  /// [Lounge/PostCreate] 投稿画像の読み込み失敗。
  final loungePostImageDecodeFailed = const AppMessage(
    message:
        '画像を読み込めませんでした。ファイルが壊れているか、対応外の形式の可能性があります。別の画像を選択してください（JPG/PNGのみ）。',
  );

  /// [Lounge/PostCreate] 投稿画像の解像度超過。
  final loungePostImageTooLargeDimension = const AppMessage(
    message:
        '画像サイズが大きすぎます（${LoungeConstants.postImageMaxSidePx}px以下）',
  );

  /// [Lounge/PostCreate] 投稿タイトル未入力。
  final loungePostTitleRequired = const AppMessage(
    message: 'タイトルを入力してください',
  );

  /// [Lounge/PostCreate] 投稿タイトル文字数超過。
  final loungePostTitleTooLong = const AppMessage(
    message:
        'タイトルは${LoungeConstants.postTitleMaxLength}文字以内で入力してください',
  );

  /// [Lounge/PostCreate] 投稿本文未入力。
  final loungePostContentRequired = const AppMessage(
    message: '本文を入力してください',
  );

  /// [Lounge/PostCreate] 投稿本文文字数超過。
  final loungePostContentTooLong = const AppMessage(
    message:
        '本文は${LoungeConstants.postContentMaxLength}文字以内で入力してください',
  );

  /// [Core/Error] 認証コード確認失敗。
  final verifyResetCodeFailed = const AppMessage(
    title: '認証エラー',
    message: '認証コードの確認に失敗しました。\n時間をおいて再度お試しください。',
  );

  /// [Core/Error] 認証コード再送信失敗。
  final resendResetCodeFailed = const AppMessage(
    title: '送信エラー',
    message: '再送信に失敗しました。\n時間をおいて再度お試しください。',
  );

  /// [Core/Error] 新しいパスワード設定失敗。
  final newPasswordMustBeDifferentFromCurrent = const AppMessage(
    title: '入力エラー',
    message: '新しいパスワードは現在のパスワードと異なるものを入力してください。',
  );
}


