import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';

/// 新規登録完了画面。
class RegisterSuccessPage extends ConsumerWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: SafeArea(
        child: _RegisterSuccessScrollContent(
          onPressedGoToLogin: () => context.go('/login'),
        ),
      ),
    );
  }
}

/// 新規登録完了画面のスクロール領域（本文）をまとめるクラス。
class _RegisterSuccessScrollContent extends StatelessWidget {
  const _RegisterSuccessScrollContent({
    required this.onPressedGoToLogin,
  });

  final VoidCallback onPressedGoToLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _RegisterSuccessLogo(),
            const SizedBox(height: 20),
            const _RegisterSuccessMessage(),
            const SizedBox(height: 32),
            _GoToLoginButton(onPressed: onPressedGoToLogin),
          ],
        ),
      ),
    );
  }
}

/// 画面上部のロゴを表示するクラス。
class _RegisterSuccessLogo extends StatelessWidget {
  const _RegisterSuccessLogo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.linkyLogoSvg,
      width: 50,
      height: 50,
    );
  }
}

/// 登録完了メッセージを表示するクラス。
class _RegisterSuccessMessage extends StatelessWidget {
  const _RegisterSuccessMessage();

  @override
  Widget build(BuildContext context) {
    return GradientText(
      '会員登録が完了しました。\n他のユーザーと情報を共有してみましょう!',
      gradient: AppColors.linky45degGradient,
      style: AppTextStyles.body18,
      textAlign: TextAlign.center,
    );
  }
}

/// 「ログイン画面へ」ボタンを表示するクラス。
class _GoToLoginButton extends StatelessWidget {
  const _GoToLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'ログイン画面へ',
      onPressed: onPressed,
      backgroundColor: AppColors.loginButton,
      textColor: AppColors.primaryWhite,
      style: AuthActionButtonStyle.filled,
    );
  }
}
