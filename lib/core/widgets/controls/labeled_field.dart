import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// ラベルと入力ウィジェットをまとめる共通レイアウト。
class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.child,
    this.isRequired = false,
    this.requiredMark,
    this.trailing,
    this.labelStyle,
    this.labelSpacing = 8,
  });

  /// ラベル文字列
  final String label;

  /// 入力欄（TextField / TextFormField など）
  final Widget child;

  /// 必須マークを表示するかどうか。
  final bool isRequired;

  /// 必須マークのウィジェット（例：アスタリスクのSVG）。
  final Widget? requiredMark;

  /// ラベル右側に置くウィジェット（任意）。
  final Widget? trailing;

  /// ラベルのスタイル（未指定なら共通スタイル）。
  final TextStyle? labelStyle;

  /// ラベルと入力欄の間隔。
  final double labelSpacing;

  @override
  Widget build(BuildContext context) {
    final resolvedLabelStyle =
        labelStyle ?? AppTextStyles.body14.copyWith(color: AppColors.primaryGray);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: resolvedLabelStyle),
            if (isRequired && requiredMark != null) ...[
              const SizedBox(width: 4),
              requiredMark!,
            ],
            if (trailing != null) ...[
              const Spacer(),
              trailing!,
            ],
          ],
        ),
        SizedBox(height: labelSpacing),
        child,
      ],
    );
  }
}


