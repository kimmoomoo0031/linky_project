import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_input_decorations.dart';

/// パスワード再設定リクエスト画面。
///
/// ログイン画面と同様に、StateNotifier + State を利用して
/// 入力値とローディング状態、エラーを一元管理する。
class PasswordResetPage extends ConsumerWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(passwordResetControllerProvider);
    final controller = ref.read(passwordResetControllerProvider.notifier);

    // generalErrorMessage がセットされたときにだけダイアログを出し、
    // 送信成功（isSuccess == true）になったタイミングでログイン画面へ遷移する。
    ref.listen(passwordResetControllerProvider, (previous, next) async {
      final message = next.generalErrorMessage;
      if (message != null && message.isNotEmpty) {
        final type = next.generalErrorType ?? LinkyDialogType.info;
        await showLinkyDialog(
          context: context,
          message: message,
          type: type,
        );
        controller.clearGeneralMessage();
      }

      if (previous?.isSuccess != true && next.isSuccess) {
        context.go('/login');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(
        title: 'パスワード再設定',
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Center(
                child: Image.asset(
                  'assets/images/common/password_reset_logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Text(
                'パスワードを再設定するための\nメールアドレスを入力してください。',
                style: AppTextStyles.body14.copyWith(
                  color: AppColors.primaryGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'メールアドレス',
                style: AppTextStyles.body14.copyWith(
                  color: AppColors.primaryGray,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: controller.onEmailChanged,
                decoration: AuthInputDecorations.textField(
                  hintText: 'yamada@example.com',
                  errorText: state.emailError,
                ),
              ),
              const SizedBox(height: 48),
              AuthActionButton(
                label: '送信する',
                onPressed: controller.submit,
                backgroundColor: AppColors.loginButton,
                textColor: AppColors.primaryWhite,
                style: AuthActionButtonStyle.filled,
                isLoading: state.isLoading,
              ),
              const SizedBox(height: 24),
              AuthActionButton(
                label: 'もどる',
                onPressed: () => context.pop(),
                backgroundColor: AppColors.primaryWhite,
                textColor: AppColors.primaryGray,
                borderColor: AppColors.outlineGray,
                style: AuthActionButtonStyle.outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

