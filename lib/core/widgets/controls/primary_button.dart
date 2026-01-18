import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 共通のプライマリボタン。
class LinkyPrimaryButton extends StatelessWidget {
  const LinkyPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDestructive = false,
    this.isFullWidth = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isDestructive;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final fg = isDestructive ? cs.onError : cs.onPrimary;

    final button = FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.body16Bold.copyWith(color: fg),
      ),
    );

    if (!isFullWidth) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}

