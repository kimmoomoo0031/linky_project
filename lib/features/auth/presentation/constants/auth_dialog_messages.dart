/// 認証（auth）機能で使うダイアログ/説明文言。
///
/// アプリ全体共通の文言（ネットワーク/サーバー等）は
/// `core/constants/common_dialog_messages.dart` に置く。
class AuthDialogMessages {
  const AuthDialogMessages._();

  // ---- 新規登録：入力ルール ----
  static const String registerInputRuleTitle = '入力ルール';
  static const String registerInputRuleBody = '''
・メールアドレスは形式に沿って入力してください。
・ニックネームは半角・全角を問わず、2〜12文字で入力してください。
・パスワードは8文字以上で入力してください。
・パスワードは英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';

  // ---- パスワード再設定：説明文 ----
  static const String passwordResetDescription = '''
・8文字以上で入力してください。
・英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';

  // ---- 認証コード/再設定フロー ----
  static const String resetEmailSent = 'パスワード再設定用のコードを送信しました。';
  static const String invalidResetCode = '認証コードが無効です。\nもう一度やり直してください。';
  static const String resetPasswordSuccess = '新しいパスワードを設定しました。';
}


