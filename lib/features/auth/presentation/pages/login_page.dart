import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/login_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/login_state.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_password_field.dart';

/// Linky ログイン画面。
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);
    final cs = Theme.of(context).colorScheme;

    // ダイアログ表示イベント（1回限り）。
    ref.listen(loginDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;
      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      ref.read(loginDialogEventProvider.notifier).state = null;
    });

    // ログイン成功（isSuccess == true）になったタイミングでホームへ遷移する。
    ref.listen(loginControllerProvider, (previous, next) {
      if (previous?.isSuccess != true && next.isSuccess) {
        context.go('/home');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: _LoginScrollContent(
          state: state,
          controller: controller,
          onPressedForgotPassword: () {
            controller.clearValidationErrors();
            context.push('/passwordReset');
          },
          onPressedSignUp: () {
            controller.clearValidationErrors();
            context.push('/terms');
          },
          onPressedLineLogin: () {
            // TODO: LINE ログイン
          },
          onPressedGoogleLogin: () {
            // TODO: Google ログイン
          },
          onPressedGuestLogin: () {
            // TODO: ゲストでログイン
          },
        ),
      ),
    );
  }
}

/// ログイン画面のスクロール領域（本文）をまとめるクラス。
///
/// 画面内の各セクション（ヘッダー、メール/パスワード入力、ログイン、SNSログイン、導線）を配置する。
class _LoginScrollContent extends StatelessWidget {
  const _LoginScrollContent({
    required this.state,
    required this.controller,
    required this.onPressedForgotPassword,
    required this.onPressedSignUp,
    required this.onPressedLineLogin,
    required this.onPressedGoogleLogin,
    required this.onPressedGuestLogin,
  });

  final LoginState state;
  final LoginController controller;
  final VoidCallback onPressedForgotPassword;
  final VoidCallback onPressedSignUp;
  final VoidCallback onPressedLineLogin;
  final VoidCallback onPressedGoogleLogin;
  final VoidCallback onPressedGuestLogin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const _LoginHeader(),
          const SizedBox(height: 40),
          _EmailField(
            onChanged: controller.onEmailChanged,
            errorText: state.emailError,
          ),
          const SizedBox(height: 16),
          _PasswordField(
            onChanged: controller.onPasswordChanged,
            errorText: state.passwordError,
          ),
          _ForgotPasswordLink(onPressed: onPressedForgotPassword),
          const SizedBox(height: 16),
          _LoginButton(
            isLoading: state.isLoading,
            onPressed: controller.submit,
          ),
          const SizedBox(height: 32),
          const _OrDivider(),
          const SizedBox(height: 32),
          _LineLoginButton(onPressed: onPressedLineLogin),
          const SizedBox(height: 20),
          _GoogleLoginButton(onPressed: onPressedGoogleLogin),
          const SizedBox(height: 20),
          _GuestLoginButton(onPressed: onPressedGuestLogin),
          const SizedBox(height: 20),
          _SignUpLink(onPressed: onPressedSignUp),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// ログイン画面のヘッダー（タグライン）を表示するクラス。
class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientText(
          'つながる・見つける・楽しむ',
          gradient: AppColors.linky45degGradient,
          // ログイン画面ではやや小さめの本文スタイルでタグラインを表示する。
          style: AppTextStyles.heading24,
        ),
      ],
    );
  }
}

/// メールアドレス入力欄（ラベル + TextField）を表示するセクション用クラス。
class _EmailField extends StatelessWidget {
  const _EmailField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: 'メールアドレス',
      hintText: 'yamada@example.com',
      keyboardType: TextInputType.emailAddress,
      errorText: errorText,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
    );
  }
}

/// パスワード入力欄（ラベル + 表示切替）を表示するセクション用クラス。
class _PasswordField extends StatelessWidget {
  const _PasswordField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: 'パスワード',
      errorText: errorText,
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
    );
  }
}

/// 「パスワードを忘れた方はこちら」リンクを表示するクラス。
class _ForgotPasswordLink extends StatelessWidget {
  const _ForgotPasswordLink({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'パスワードを忘れた方はこちら',
          style: AppTextStyles.body12.copyWith(
            color: cs.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

/// 「ログイン」ボタンを表示するクラス。
class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: 'ログイン',
      onPressed: onPressed,
      backgroundColor: cs.primary,
      textColor: cs.onPrimary,
      borderColor: Colors.transparent,
      style: AuthActionButtonStyle.filled,
      isLoading: isLoading,
    );
  }
}

/// 区切り線（「または」）を表示するクラス。
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'または',
            style: AppTextStyles.body16.copyWith(color: cs.onSurfaceVariant),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}

/// LINEログインボタンを表示するクラス。
class _LineLoginButton extends StatelessWidget {
  const _LineLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'LINEでログイン',
      icon: SvgPicture.asset(AppAssets.lineLogoSvg, width: 20, height: 20),
      onPressed: onPressed,
      backgroundColor: AppColors.lineButton,
      textColor: AppColors.primaryWhite,
      style: AuthActionButtonStyle.filled,
    );
  }
}

/// Googleログインボタンを表示するクラス。
class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: 'Googleでログイン',
      icon: SvgPicture.asset(AppAssets.googleLogoSvg, width: 20, height: 20),
      onPressed: onPressed,
      backgroundColor: cs.surface,
      textColor: cs.onSurface,
      borderColor: cs.outlineVariant,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

/// ゲストログインボタンを表示するクラス。
class _GuestLoginButton extends StatelessWidget {
  const _GuestLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AuthActionButton(
      label: 'ゲストでログイン',
      icon: SvgPicture.asset(
        AppAssets.userLogoSvg,
        width: 20,
        height: 20,
        colorFilter: isDark
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : null,
      ),
      onPressed: onPressed,
      backgroundColor: cs.surface,
      textColor: cs.onSurface,
      borderColor: cs.outlineVariant,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

/// 「新規登録はこちらから」リンクを表示するクラス。
class _SignUpLink extends StatelessWidget {
  const _SignUpLink({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          '新規登録はこちらから',
          style: AppTextStyles.body12.copyWith(
            color: cs.primary,
          ),
        ),
      ),
    );
  }
}
