import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/labeled_field.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_input_decorations.dart';

/// 認証画面でよく使う「ラベル + TextField + エラー表示」をまとめた共通ウィジェット。
///
/// - ラベルと入力欄の間隔（8px）を統一
/// - エラー表示/枠線は AuthInputDecorations に統一
/// - 必須マーク（任意）も同じ場所に表示できる
class AuthLabeledTextField extends StatelessWidget {
  const AuthLabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
    this.isRequired = false,
    this.requiredMark,
    this.autofillHints,
    this.inputFormatters,
    this.textInputAction,
    this.minLines,
    this.maxLines,
  });

  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? errorText;

  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enabled;

  /// 必須マークを表示するかどうか。
  final bool isRequired;

  /// 必須マークのウィジェット（例：アスタリスクのSVG）。
  /// `isRequired == true` のときに表示される。
  final Widget? requiredMark;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return LabeledField(
      label: label,
      isRequired: isRequired,
      requiredMark: requiredMark,
      labelStyle: AppTextStyles.body14.copyWith(color: cs.onSurfaceVariant),
      labelSpacing: 8,
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        minLines: minLines,
        maxLines: maxLines ?? (obscureText ? 1 : null),
        decoration: AuthInputDecorations.textField(
          context: context,
          hintText: hintText,
          errorText: errorText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}


