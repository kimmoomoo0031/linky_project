import 'package:flutter/material.dart';

import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';

/// 認証画面のパスワード入力欄（表示/非表示トグル付き）。
///
/// ※一般のテキスト入力とは責務が増えやすいので、別コンポーネントとして分離する。
class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({
    super.key,
    required this.label,
    required this.onChanged,
    this.errorText,
    this.hintText = '********',
    this.isRequired = false,
    this.requiredMark,
    this.textInputAction,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final String hintText;
  final bool isRequired;
  final Widget? requiredMark;
  final TextInputAction? textInputAction;

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: widget.label,
      hintText: widget.hintText,
      obscureText: _obscure,
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      isRequired: widget.isRequired,
      requiredMark: widget.requiredMark,
      textInputAction: widget.textInputAction,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}


