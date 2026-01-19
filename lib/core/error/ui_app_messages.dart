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

  /// [Core/Error] 認証コード再送信成功。
  final resendResetCodeSucceeded = const AppMessage(
    message: '認証コードを再送信しました。',
  );
}

/// [Core/Error] 共通：失敗メッセージ（ダイアログ/スナックバー用）
class _CommonFailureMessages {
  const _CommonFailureMessages();

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


