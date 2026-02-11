import 'package:flutter/material.dart';

/// ラウンジ投稿作成で、ゲスト用に使用するシンプルなテキストフィールド。
class LoungeGuestPostTextField extends StatelessWidget {
  const LoungeGuestPostTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.textInputAction,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: cs.outlineVariant, fontSize: 14),
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cs.primary, width: 1),
        ),
      ),
    );
  }
}


