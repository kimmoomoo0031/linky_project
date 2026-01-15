import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/auth_constants.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/register_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/register_state.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_password_field.dart';

import 'package:linky_project_0318/core/constants/auth_constants.dart';

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

    // ダイアログ表示イベント（1回限り）
    ref.listen(registerDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;
      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      ref.read(registerDialogEventProvider.notifier).state = null;
    });

    // 登録成功（isSuccess == true）になったタイミングで成功画面へ遷移する。
    ref.listen(registerControllerProvider, (previous, next) async {
      if (previous?.isSuccess != true && next.isSuccess) {
        context.goSignUpSuccess();
      }
    });

    return Scaffold(
      appBar: const LinkyAppBar(title: '新規登録', showBackButton: true),
      body: SafeArea(
        child: _RegisterScrollContent(
          state: state,
          controller: controller,
          onPressedHelp: () {
            showLinkyDialog(
              context: context,
              title: AuthConstants.registerInputRuleTitle,
              message: AuthConstants.registerInputRuleBody,
              type: LinkyDialogType.info,
            );
          },
          onPressedSubmit: controller.submit,
          onPressedLineLogin: () {
            // TODO: LINE ログイン
          },
          onPressedGoogleLogin: () {
            // TODO: Google ログイン
          },
          onPressedLoginWithoutRegister: () => context.pop(),
        ),
      ),
    );
  }
}

/// 新規登録画面のスクロール領域（本文）をまとめるクラス。
///
/// 画面内の各セクション（ヘルプ、入力フォーム、登録ボタン、SNSログイン、導線）を配置する。
class _RegisterScrollContent extends StatelessWidget {
  const _RegisterScrollContent({
    required this.state,
    required this.controller,
    required this.onPressedHelp,
    required this.onPressedSubmit,
    required this.onPressedLineLogin,
    required this.onPressedGoogleLogin,
    required this.onPressedLoginWithoutRegister,
  });

  final RegisterState state;
  final RegisterController controller;
  final VoidCallback onPressedHelp;
  final VoidCallback onPressedSubmit;
  final VoidCallback onPressedLineLogin;
  final VoidCallback onPressedGoogleLogin;
  final VoidCallback onPressedLoginWithoutRegister;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HelpIconButton(onPressed: onPressedHelp),
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
          _RegisterButton(
            isLoading: state.isLoading,
            enabled: state.canSubmit,
            onPressed: onPressedSubmit,
          ),
          const SizedBox(height: 20),
          _LineLoginButton(onPressed: onPressedLineLogin),
          const SizedBox(height: 20),
          _GoogleLoginButton(onPressed: onPressedGoogleLogin),
          const SizedBox(height: 20),
          _LoginWithoutRegisterLink(onPressed: onPressedLoginWithoutRegister),
        ],
      ),
    );
  }
}

/// 入力ルールなどのヘルプダイアログを開くアイコンボタンを表示するクラス。
class _HelpIconButton extends StatelessWidget {
  const _HelpIconButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          AppAssets.helpCircleLogoSvg,
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}

/// 「登録する」ボタンを表示するクラス。
class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.isLoading,
    required this.enabled,
    required this.onPressed,
  });

  final bool isLoading;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: '登録する',
      onPressed: enabled ? onPressed : null,
      backgroundColor: cs.primary,
      textColor: cs.onPrimary,
      style: AuthActionButtonStyle.filled,
      isLoading: isLoading,
    );
  }
}

/// 「登録なしでログインする」リンクを表示するクラス。
class _LoginWithoutRegisterLink extends StatelessWidget {
  const _LoginWithoutRegisterLink({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          '登録なしでログインする',
          style: AppTextStyles.body12.copyWith(
            color: cs.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

/// メールアドレス入力欄（ラベル + 必須 + TextField）を表示するセクション用クラス。
class _EmailField extends StatelessWidget {
  const _EmailField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: 'メールアドレス',
      hintText: AuthConstants.email,
      keyboardType: TextInputType.emailAddress,
      errorText: errorText,
      onChanged: onChanged,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// ニックネーム入力欄（ラベル + 必須 + TextField）を表示するセクション用クラス。
class _NicknameField extends StatelessWidget {
  const _NicknameField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: 'ニックネーム',
      hintText: AuthConstants.nickname,
      errorText: errorText,
      onChanged: onChanged,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// パスワード入力欄（必須 + 表示切替）を表示するセクション用クラス。
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
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// パスワード再確認入力欄（必須 + 表示切替）を表示するセクション用クラス。
class _PasswordConfirmField extends StatelessWidget {
  const _PasswordConfirmField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: 'パスワード再確認',
      errorText: errorText,
      onChanged: onChanged,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.done,
    );
  }
}

/// LINEログインボタンを表示するクラス。
class _LineLoginButton extends StatelessWidget {
  const _LineLoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: 'LINEでログイン',
      icon: SvgPicture.asset(
        AppAssets.lineLogoSvg,
        width: 20,
        height: 20,
      ),
      onPressed: onPressed,
      backgroundColor: cs.surface,
      textColor: cs.onSurface,
      borderColor: cs.outlineVariant,
      style: AuthActionButtonStyle.outlined,
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
      icon: SvgPicture.asset(
        AppAssets.googleLogoSvg,
        width: 20,
        height: 20,
      ),
      onPressed: onPressed,
      backgroundColor: cs.surface,
      textColor: cs.onSurface,
      borderColor: cs.outlineVariant,
      style: AuthActionButtonStyle.outlined,
    );
  }
}
