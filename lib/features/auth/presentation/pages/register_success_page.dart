import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../widgets/auth_action_button.dart';

class RegisterSuccessPage extends ConsumerWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/common/linky_logo.svg',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 20),
                GradientText(
                  '会員登録が完了しました\n他のユーザーと情報を共有してみましょう!',
                  gradient: AppColors.linky45degGradient,
                  style: AppTextStyles.splashTitleTextStyle24,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                ),
                const SizedBox(height: 32),
                AuthActionButton(
                  label: 'ログイン画面へ',
                  onPressed: () {
                    context.go('/login');
                  },
                  backgroundColor: AppColors.loginButton,
                  textColor: AppColors.primaryWhite,
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
