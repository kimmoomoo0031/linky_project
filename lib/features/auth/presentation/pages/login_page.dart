import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_input_decorations.dart';

/// Linky ログイン画面。
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    // generalErrorMessage がセットされたときにだけダイアログを出す。
    ref.listen(loginControllerProvider, (previous, next) async {
      final message = next.generalErrorMessage;
      if (message == null || message.isEmpty) {
        return;
      }

      // ダイアログを表示して、閉じたタイミングでエラーをクリアする。
      final type = next.generalErrorType ?? LinkyDialogType.info;
      showLinkyDialog(
        context: context,
        message: message,
        type: type,
      ).then((_) {
        ref.read(loginControllerProvider.notifier).clearGeneralError();
      });
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: パスワードリセット画面へ遷移
                  },
                  child: Text(
                    'パスワードを忘れた方はこちら',
                    style: AppTextStyles.body12.copyWith(
                      color: AppColors.primaryGray,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AuthActionButton(
                label: 'ログイン',
                onPressed: controller.submit,
                backgroundColor: AppColors.loginButton,
                textColor: AppColors.primaryWhite,
                borderColor: Colors.transparent,
                style: AuthActionButtonStyle.filled,
                isLoading: state.isLoading,
              ),
              const SizedBox(height: 32),
              const _OrDivider(),
              const SizedBox(height: 32),
              _LineLoginButton(
                onPressed: () {
                  // TODO: LINE ログイン
                },
              ),
              const SizedBox(height: 20),
              _GoogleLoginButton(
                onPressed: () {
                  // TODO: Google ログイン
                },
              ),
              const SizedBox(height: 20),
              _GuestLoginButton(
                onPressed: () {
                  // TODO: ゲストでログイン
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.push('/terms');
                  },
                  child: Text(
                    '新規登録はこちらから',
                    style: AppTextStyles.body12.copyWith(
                      color: AppColors.primaryActionBlue
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

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

class _EmailField extends StatelessWidget {
  const _EmailField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'メールアドレス',
          style: AppTextStyles.body14.copyWith(color: AppColors.primaryGray),
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

class _PasswordField extends StatefulWidget {
  const _PasswordField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'パスワード',
          style: AppTextStyles.body14.copyWith(color: AppColors.primaryGray),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: _obscure,
          onChanged: widget.onChanged,
          decoration: AuthInputDecorations.textField(
            hintText: '********',
            errorText: widget.errorText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'または',
            style: AppTextStyles.body16.copyWith(color: AppColors.primaryGray),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}

class _LineLoginButton extends StatelessWidget {
  const _LineLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'LINEでログイン',
      icon: SvgPicture.asset('assets/images/common/line_logo.svg', width: 20, height: 20,),
      onPressed: onPressed,
      backgroundColor: AppColors.lineButton,
      textColor: AppColors.primaryWhite,
      style: AuthActionButtonStyle.filled,
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'Googleでログイン',
      icon: SvgPicture.asset('assets/images/common/google_logo.svg', width: 20, height: 20,),
      onPressed: onPressed,
      backgroundColor: AppColors.primaryWhite,
      textColor: AppColors.primaryBlack,
      borderColor: AppColors.outlineGray,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

class _GuestLoginButton extends StatelessWidget {
  const _GuestLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'ゲストでログイン',
      icon: SvgPicture.asset('assets/images/common/user_logo.svg', width: 20, height: 20,),
      onPressed: onPressed,
      backgroundColor: AppColors.primaryWhite,
      textColor: AppColors.primaryBlack,
      borderColor: AppColors.outlineGray,
      style: AuthActionButtonStyle.outlined,
    );
  }
}
