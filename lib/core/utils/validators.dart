import 'package:linky_project_0318/core/utils/regex.dart';
import 'package:characters/characters.dart';
import 'package:linky_project_0318/core/constants/lounge_constants.dart';

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

  ///ニックネームバリデーション
  static String? validateNickname(String value) {
    if (value.isEmpty) {
      return 'ニックネームを入力してください';
    }
    if (!RegexPatterns.nickName.hasMatch(value)) {
      return 'ニックネームは2〜12文字で入力してください';
    }
    // 必要になれば、文字数や使用可能文字などのルールをここに追加する。
    return null;
  }

  /// ラウンジ名バリデーション
  static String? validateLoungeName(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'ラウンジ名を入力してください';
    }

    final len = trimmed.characters.length;
    if (len < LoungeCreateConstants.nameMinLength ||
        len > LoungeCreateConstants.nameMaxLength) {
      return 'ラウンジ名は${LoungeCreateConstants.nameMinLength}〜${LoungeCreateConstants.nameMaxLength}文字で入力してください';
    }

    if (!RegexPatterns.loungeAllowed.hasMatch(trimmed)) {
      return 'ラウンジ名は英字・日本語・「-」のみ入力できます';
    }
    return null;
  }

  /// ラウンジ紹介バリデーション
  static String? validateLoungeDescription(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'ラウンジ紹介を入力してください';
    }

    final len = trimmed.characters.length;
    if (len < LoungeCreateConstants.descriptionMinLength ||
        len > LoungeCreateConstants.descriptionMaxLength) {
      return 'ラウンジ紹介は${LoungeCreateConstants.descriptionMinLength}〜${LoungeCreateConstants.descriptionMaxLength}文字で入力してください';
    }

    if (!RegexPatterns.loungeAllowed.hasMatch(trimmed)) {
      return 'ラウンジ紹介は英字・日本語・「-」のみ入力できます';
    }
    return null;
  }

  ///パスワード再確認バリデーション
  static String? validatePasswordConfirmation({
    required String password,
    required String confirmation,
  }) {
    if (confirmation.isEmpty) {
      return 'パスワード（再確認）を入力してください';
    }
    if (confirmation != password) {
      return 'パスワードが一致しません';
    }
    return null;
  }

  ///認証番号4桁確認バリデーション
  static String? validateOtpCode(
    String code, {
    int length = 4,
  }) {
    final trimmed = code.trim();

    if (trimmed.isEmpty) {
      return '認証コードを入力してください。';
    }

    if (!RegexPatterns.otpCode(length: length).hasMatch(trimmed)) {
      return '$length桁の認証コードを入力してください。';
    }
    return null;
  }
}