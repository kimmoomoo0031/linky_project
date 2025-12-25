import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
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
    required BuildContext context,
    String? hintText,
    String? errorText,
    Widget? suffixIcon,
  }) {
    final cs = Theme.of(context).colorScheme;
    final hasError = errorText != null && errorText.trim().isNotEmpty;
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.body12.copyWith(
        color: cs.outlineVariant,
      ),
      filled: true,
      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.outlineVariant),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cs.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: cs.error,
          width: 1,
        ),
      ),
      errorText: null,
      error: hasError ? _ErrorField(text: errorText) : null,
      suffixIcon: suffixIcon,
    );
  }
}

/// TextField のバリデーションエラー表示（アイコン + 文言）。
///
/// - エラーがある時だけ [InputDecoration.error] に渡して表示する
/// - 色は Theme(ColorScheme.error) に追従する
class _ErrorField extends StatelessWidget {
  const _ErrorField({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.alertTriangleLogoSvg,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(cs.error, BlendMode.srcIn),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body12.copyWith(
              color: cs.error,
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}



