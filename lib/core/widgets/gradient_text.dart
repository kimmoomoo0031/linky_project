import 'package:flutter/material.dart';

/// グラデーションカラーでテキストを描画するための共通ウィジェット。
///
/// [gradient] には `AppColors.linky45degGradient` などを渡して使用します。
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final Gradient gradient;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: baseStyle.copyWith(
          // ShaderMask で上書きされるので、ここでは単色を指定しておく
          color: Colors.white,
        ),
      ),
    );
  }
}


