import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// グラデーションカラーでテキストを描画するための共通ウィジェット。
///
/// [gradient] には `AppColors.linky45degGradient` などを渡して使用します。
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
    this.textAlign,
    this.fontSize
  });

  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? fontSize;

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
          fontSize: fontSize,
          color: AppColors.primaryWhite,
        ),
      ),
    );
  }
}


