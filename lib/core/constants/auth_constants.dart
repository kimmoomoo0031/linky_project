/// 認証（Auth）関連の定数を集約する。
class AuthConstants {
  const AuthConstants._();

  /// [Auth/Common] メール入力欄の hintText（例: 形式の見本）。
  static const String email = 'linky@example.com';

  /// [Auth/Common] ニックネーム入力欄の hintText（例）。
  static const String nickname = 'リンゴ';

  /// [Auth/Register] 入力ルールのタイトル。
  static const String registerInputRuleTitle = '入力ルール';

  /// [Auth/Register] 入力ルール本文。
  static const String registerInputRuleBody = '''
・メールアドレスは形式に沿って入力してください。
・ニックネームは半角・全角を問わず、2〜12文字で入力してください。
・パスワードは8文字以上で入力してください。
・パスワードは英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';

  /// [Auth/PasswordResetNewPassword] 新パスワード要件の説明文。
  static const String passwordResetDescription = '''
・8文字以上で入力してください。
・英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';

  /// [Auth/PasswordReset] 再設定用コード送信完了メッセージ。
  static const String resetEmailSent = 'パスワード再設定用のコードを送信しました。';

  /// [Auth/PasswordResetCode] 無効な認証番号タイトル。
  static const String invalidOtpCodeTitle = '無効な認証番号';

  /// [Auth/PasswordResetCode] 無効な認証番号メッセージ。
  static const String invalidOtpCodeMessage =
      '入力された認証番号が正しくありません。\nもう一度確認してください。';

  /// [Auth/PasswordResetNewPassword] 無効な再設定コードメッセージ。
  static const String invalidResetCode = '認証コードが無効です。\nもう一度やり直してください。';

  /// [Auth/PasswordResetNewPassword] 新しいパスワード設定成功メッセージ。
  static const String resetPasswordSuccess = '新しいパスワードを設定しました。';

  /// [Auth/PasswordResetSuccess] パスワード設定完了タイトル。
  static const String passwordResetCompleted = 'パスワード設定が完了しました！';

  /// [Auth/PasswordResetSuccess] パスワード設定完了本文。
  static const String passWordResetCompletedContext = '新しいパスワードでログインしてください。';

  /// [Auth/RegisterSuccess] 会員登録完了メッセージ。
  static const String registerCompletedMessage =
      '会員登録が完了しました。\n他のユーザーと情報を共有してみましょう!';

  /// [Auth/SignUpAgreement] 会員登録前に利用規約確認を促す説明文。
  static const String signUpAgreementDescription =
      '会員登録を進める前に、利用規約をご確認ください。';
}


