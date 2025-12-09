import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_input_decorations.dart';

import '../../../../core/constants/dialog_messages.dart';

/// Linky 新規登録画面。
///
/// ログイン画面と同じく、Riverpod の StateNotifier + State を使って
/// 入力値とエラーメッセージを一元管理する。
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);

    // generalErrorMessage がセットされたときにだけダイアログを出し、
    // 登録成功（isSuccess == true）になったタイミングで成功画面へ遷移する。
    ref.listen(registerControllerProvider, (previous, next) async {
      final message = next.generalErrorMessage;

      if (message != null && message.isNotEmpty) {
        final type = next.generalErrorType ?? LinkyDialogType.info;
        await showLinkyDialog(context: context, message: message, type: type);
        ref.read(registerControllerProvider.notifier).clearGeneralError();
      }

      // 登録成功を検知して成功画面へ遷移
      if (previous?.isSuccess != true && next.isSuccess) {
        context.go('/signUpSuccess');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(title: '新規登録', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showLinkyDialog(
                        context: context,
                        title: AuthDialogMessages.registerInputRuleTitle,
                        message: AuthDialogMessages.registerInputRuleBody,
                        type: LinkyDialogType.info,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/images/common/helpcircle_logo.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              _EmailField(
                onChanged: controller.onEmailChanged,
                errorText: state.emailError,
              ),
              const SizedBox(height: 16),
              _NicknameField(
                onChanged: controller.onNicknameChanged,
                errorText: state.nicknameError,
              ),
              const SizedBox(height: 16),
              _PasswordField(
                onChanged: controller.onPasswordChanged,
                errorText: state.passwordError,
              ),
              const SizedBox(height: 16),
              _PasswordConfirmField(
                onChanged: controller.onPasswordConfirmChanged,
                errorText: state.passwordConfirmError,
              ),
              const SizedBox(height: 32),
              AuthActionButton(
                label: '登録する',
                onPressed: controller.submit,
                backgroundColor: AppColors.loginButton,
                textColor: AppColors.primaryWhite,
                style: AuthActionButtonStyle.filled,
                isLoading: state.isLoading,
              ),
              const SizedBox(height: 20),
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
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: ログイン画面へ戻る
                    context.pop();
                  },
                  child: Text(
                    '登録なしでログインする',
                    style: AppTextStyles.body12.copyWith(
                      color: AppColors.primaryActionBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ラベル + 必須アスタリスクをまとめた共通ウィジェット。
class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.body14.copyWith(color: AppColors.primaryGray),
        ),
        const SizedBox(width: 4),
        // デザインで使用している「必須マーク」のアスタリスクアイコン。
        // 実際のパス / 形式に合わせて拡張子は調整してください。
        SvgPicture.asset(
          'assets/images/common/asterisk_logo.svg',
          width: 8,
          height: 8,
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
        const _RequiredLabel('メールアドレス'),
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

class _NicknameField extends StatelessWidget {
  const _NicknameField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RequiredLabel('ニックネーム'),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          decoration: AuthInputDecorations.textField(
            hintText: 'リンゴ',
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
        const _RequiredLabel('パスワード'),
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

class _PasswordConfirmField extends StatefulWidget {
  const _PasswordConfirmField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  State<_PasswordConfirmField> createState() => _PasswordConfirmFieldState();
}

class _PasswordConfirmFieldState extends State<_PasswordConfirmField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RequiredLabel('パスワード再確認'),
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

class _LineLoginButton extends StatelessWidget {
  const _LineLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: 'LINEでログイン',
      icon: SvgPicture.asset(
        'assets/images/common/line_logo.svg',
        width: 20,
        height: 20,
      ),
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
      icon: SvgPicture.asset(
        'assets/images/common/google_logo.svg',
        width: 20,
        height: 20,
      ),
      onPressed: onPressed,
      backgroundColor: AppColors.primaryWhite,
      textColor: AppColors.primaryBlack,
      borderColor: AppColors.outlineGray,
      style: AuthActionButtonStyle.outlined,
    );
  }
}
