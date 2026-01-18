import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 案内/ルール文を表示する共通ボックス。
class LinkyInfoBox extends StatelessWidget {
  const LinkyInfoBox({
    super.key,
    required this.text,
    this.translateOffsetY = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  final String text;

  /// ボックス内の本文を少し下げるオフセット（デザイン調整用）。
  final double translateOffsetY;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final child = Padding(
      padding: padding,
      child: Text(
        text,
        style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
        textAlign: TextAlign.left,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cs.outlineVariant),
        color: cs.surface,
      ),
      child: translateOffsetY == 0
          ? child
          : Transform.translate(
              offset: Offset(0, translateOffsetY),
              child: child,
            ),
    );
  }
}


