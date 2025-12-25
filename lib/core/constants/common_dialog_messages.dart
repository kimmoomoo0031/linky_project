/// アプリ全体で共通に使うダイアログ文言。
///
/// feature 固有の文言は `features/.../constants` に置く。
class CommonDialogMessages {
  const CommonDialogMessages._();

  /// ---- 共通：エラーメッセージ（ダイアログ用）----
  static const String networkError =
      'ネットワークエラーが発生しました。\n通信状況を確認してから、もう一度お試しください。';

  static const String serverError =
      'サーバーエラーが発生しました。\nしばらく時間をおいて再度お試しください。';

  static const String unexpectedError =
      '予期せぬエラーが発生しました。\nしばらく時間をおいて再度お試しください。';

  /// ---- 共通：成功メッセージ（ダイアログ用）----

  /// 更新成功。
  static const String profileUpdated = 'プロフィールの編集が完了しました。';

  /// 認証コード再送信成功。
  static const String resendResetCodeSucceeded = '認証コードを再送信しました。';

  /// ---- 共通：失敗メッセージ（ダイアログ用）----

  /// 認証コード確認失敗。
  static const String verifyResetCodeFailed =
      '認証コードの確認に失敗しました。\n時間をおいて再度お試しください。';

  /// 認証コード再送信失敗。
  static const String resendResetCodeFailed =
      '再送信に失敗しました。\n時間をおいて再度お試しください。';

  ///新しいパスワード設定失敗
  static const String newPasswordMustBeDifferentFromCurrent =
      '新しいパスワードは現在のパスワードと異なるものを入力してください。';
}


