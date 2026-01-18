import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';

/// グラデーションカラーでテキストを描画する共通ウィジェット。
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
    this.textAlign,
  });

  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        textAlign: textAlign,
        style: baseStyle.copyWith(
          color: AppColors.primaryWhite,
        ),
      ),
    );
  }
}


