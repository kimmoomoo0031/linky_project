import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_state.dart';
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
        context.push(
          '/passwordResetCode',
          extra: next.email,
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(
        title: 'パスワード再設定',
        showBackButton: true,
      ),
      body: SafeArea(
        child: _PasswordResetScrollContent(
          state: state,
          onEmailChanged: controller.onEmailChanged,
          onPressedSubmit: controller.submit,
          onPressedBack: () => context.pop(),
        ),
      ),
    );
  }
}

/// パスワード再設定画面のスクロール領域（本文）をまとめるクラス。
///
/// 画面内の各セクション（ヘッダー、メール入力、送信/戻るボタン）を配置する。
class _PasswordResetScrollContent extends StatelessWidget {
  const _PasswordResetScrollContent({
    required this.state,
    required this.onEmailChanged,
    required this.onPressedSubmit,
    required this.onPressedBack,
  });

  final PasswordResetState state;
  final ValueChanged<String> onEmailChanged;
  final VoidCallback onPressedSubmit;
  final VoidCallback onPressedBack;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const _PasswordResetHeaderSection(),
          const SizedBox(height: 32),
          _EmailInputSection(
            errorText: state.emailError,
            onChanged: onEmailChanged,
          ),
          const SizedBox(height: 48),
          _SubmitButtonSection(
            isLoading: state.isLoading,
            onPressed: onPressedSubmit,
          ),
          const SizedBox(height: 24),
          _BackButtonSection(onPressed: onPressedBack),
        ],
      ),
    );
  }
}

/// パスワード再設定画面のヘッダー（ロゴ画像 + 説明文）を表示するクラス。
class _PasswordResetHeaderSection extends StatelessWidget {
  const _PasswordResetHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}

/// メールアドレス入力欄（ラベル + TextField）を表示するセクション用クラス。
///
/// バリデーションエラー時は [errorText] によりエラー表示（赤枠/メッセージ）を行う。
class _EmailInputSection extends StatelessWidget {
  const _EmailInputSection({
    required this.onChanged,
    required this.errorText,
  });

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'メールアドレス',
          style: AppTextStyles.body14.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          decoration: AuthInputDecorations.textField(
            hintText: 'yamada@example.com',
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}

/// 「送信する」ボタンを表示するクラス。
///
/// 送信中は [isLoading] によりローディング表示を行う。
class _SubmitButtonSection extends StatelessWidget {
  const _SubmitButtonSection({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: '送信する',
      onPressed: onPressed,
      backgroundColor: AppColors.loginButton,
      textColor: AppColors.primaryWhite,
      style: AuthActionButtonStyle.filled,
      isLoading: isLoading,
    );
  }
}

/// 「もどる」ボタンを表示するクラス。
class _BackButtonSection extends StatelessWidget {
  const _BackButtonSection({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'もどる',
      onPressed: onPressed,
      backgroundColor: AppColors.primaryWhite,
      textColor: AppColors.primaryGray,
      borderColor: AppColors.outlineGray,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

