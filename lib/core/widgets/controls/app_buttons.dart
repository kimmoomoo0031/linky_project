import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

/// アクションで使う小さめボタン。
class CompactActionButton  extends StatelessWidget {
  const CompactActionButton ({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 36,
    this.horizontalPadding = 14,
    this.verticalPadding = 6,
    this.borderRadius = 6,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final resolvedBg = backgroundColor ?? cs.primary;
    final resolvedText = textColor ?? cs.onPrimary;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: SizedBox(
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: resolvedBg,
            foregroundColor: resolvedText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.body12.copyWith(color: resolvedText),
          ),
        ),
      ),
    );
  }
}

/// 主要ボタン（共通）。
class ConfirmButton extends StatelessWidget {
  const ConfirmButton ({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.body16Bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

