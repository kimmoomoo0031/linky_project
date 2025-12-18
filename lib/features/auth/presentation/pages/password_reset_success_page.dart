import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';

/// パスワード再設定完了画面。
class PasswordResetSuccessPage extends ConsumerWidget {
  const PasswordResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SvgPicture.asset(AppAssets.linkyLogoSvg, width: 50, height: 50),
                const SizedBox(height: 24),
                GradientText(
                  AuthDialogMessages.passwordResetCompleted,
                  gradient: AppColors.linky45degGradient,
                  style: AppTextStyles.heading24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                GradientText(
                  AuthDialogMessages.passWordResetCompletedContext,
                  gradient: AppColors.linky45degGradient,
                  style: AppTextStyles.body14,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AuthActionButton(
                  label: 'ログイン画面へ',
                  onPressed: () => context.go('/login'),
                  backgroundColor: cs.primary,
                  textColor: cs.onPrimary,
                  style: AuthActionButtonStyle.filled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
