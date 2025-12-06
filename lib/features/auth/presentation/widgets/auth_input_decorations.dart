import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 認証画面のテキストフィールドで使用する共通の InputDecoration 定義。
class AuthInputDecorations {
  const AuthInputDecorations._();

  /// 認証系フォームで利用する標準テキストフィールド用のデコレーション。
  ///
  /// [hintText]: プレースホルダー。
  /// [errorText]: バリデーションエラー時に表示するテキスト。
  /// [suffixIcon]: 右側に表示するアイコン（パスワード表示切替など）。
  static InputDecoration textField({
    String? hintText,
    String? errorText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.body12.copyWith(
        color: AppColors.primaryGray,
      ),
      filled: true,
      fillColor: AppColors.primaryWhite,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.inputBorderFocus),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryActionBlue,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
      ),
      errorText: errorText,
      errorStyle: AppTextStyles.body12.copyWith(
        color: AppColors.error,
        height: 1.0,
      ),
      suffixIcon: suffixIcon,
    );
  }
}


