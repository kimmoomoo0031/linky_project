import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientText(
        text,
        gradient: AppColors.linky45degGradient,
        style: AppTextStyles.body14,
      ),
    );
  }
}


