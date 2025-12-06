import 'package:linky_project_0318/core/utils/regex.dart';

class Validators {
  Validators._();

  ///メールアドレスバリデーション
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!RegexPatterns.email.hasMatch(value)) {
      return 'メールアドレスの形式が正しくありません';
    }
    return null;
  }

  ///パスワードバリデーション
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    }
    if (!RegexPatterns.password.hasMatch(value)) {
      return 'パスワードは英大・数字を含めて入力してください';
    }
    return null;
  }
}