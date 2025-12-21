import 'package:flutter/material.dart';

/// アプリ全体で利用する共通の区切り線ウィジェット。
///
/// - デフォルト色は `Theme.of(context).colorScheme.outlineVariant`
/// - 線の太さは [thickness] で調整可能（デフォルト 1）
class LinkyDivider extends StatelessWidget {
  const LinkyDivider({
    super.key,
    this.thickness = 1,
    this.height,
    this.indent,
    this.endIndent,
    this.color,
  });

  final double thickness;
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Divider(
      thickness: thickness,
      height: height,
      indent: indent,
      endIndent: endIndent,
      color: color ?? cs.outlineVariant,
    );
  }
}


