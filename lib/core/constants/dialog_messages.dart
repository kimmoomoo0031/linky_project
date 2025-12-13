
///ダイアログに表示させる共通テキストファイル
class AuthDialogMessages {
  const AuthDialogMessages._();

  static const String registerInputRuleTitle = '入力ルール';
  static const String registerInputRuleBody = '''
・メールアドレスは形式に沿って入力してください。
・ニックネームは半角・全角を問わず、2〜12文字で入力してください。
・パスワードは8文字以上で入力してください。
・パスワードは英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';
  static const String passwordResetDescription = '''
・8文字以上で入力してください。
・英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';
}