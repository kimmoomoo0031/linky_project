import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';

import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_new_password_state.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_password_field.dart';

/// 新しいパスワード設定画面へ渡す引数。
///
/// TODO(api): バックエンドで token などが確定したら、ここに追加する。
class PasswordResetNewPasswordArgs {
  const PasswordResetNewPasswordArgs({required this.email, required this.code});

  final String email;
  final String code;
}

/// パスワード再設定（新しいパスワードを設定する）画面。
class PasswordResetNewPasswordPage extends ConsumerWidget {
  const PasswordResetNewPasswordPage({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(passwordResetNewPasswordControllerProvider);
    final controller = ref.read(
      passwordResetNewPasswordControllerProvider.notifier,
    );

    // ダイアログ表示イベント（1回限り）
    // 成功時（info）はダイアログを閉じた後にログインへ戻す。
    ref.listen(passwordResetNewPasswordDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;

      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      ref.read(passwordResetNewPasswordDialogEventProvider.notifier).state = null;

      if (event.type == LinkyDialogType.info && context.mounted) {
        context.go('/login');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(title: '新しいパスワード設定', showBackButton: true),
      body: SafeArea(
        child: _PasswordResetNewPasswordScrollContent(
          state: state,
          onNewPasswordChanged: controller.onNewPasswordChanged,
          onNewPasswordConfirmChanged: controller.onNewPasswordConfirmChanged,
          onPressedSubmit: () => controller.submit(email: email, code: code),
        ),
      ),
    );
  }
}

/// 新しいパスワード設定画面のスクロール領域（本文）をまとめるクラス。
class _PasswordResetNewPasswordScrollContent extends StatelessWidget {
  const _PasswordResetNewPasswordScrollContent({
    required this.state,
    required this.onNewPasswordChanged,
    required this.onNewPasswordConfirmChanged,
    required this.onPressedSubmit,
  });

  final PasswordResetNewPasswordState state;
  final ValueChanged<String> onNewPasswordChanged;
  final ValueChanged<String> onNewPasswordConfirmChanged;
  final VoidCallback onPressedSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const _PasswordRuleBox(),
          const SizedBox(height: 24),
          _NewPasswordField(
            onChanged: onNewPasswordChanged,
            errorText: state.newPasswordError,
          ),
          const SizedBox(height: 16),
          _NewPasswordConfirmField(
            onChanged: onNewPasswordConfirmChanged,
            errorText: state.newPasswordConfirmError,
          ),
          const SizedBox(height: 32),
          AuthActionButton(
            label: '設定する',
            onPressed: onPressedSubmit,
            backgroundColor: AppColors.loginButton,
            textColor: AppColors.primaryWhite,
            style: AuthActionButtonStyle.filled,
            isLoading: state.isLoading,
          ),
        ],
      ),
    );
  }
}

/// パスワード要件（ルール）を表示するボックス用クラス。
class _PasswordRuleBox extends StatelessWidget {
  const _PasswordRuleBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.outlineGray),
        color: AppColors.dialogBackground,
      ),
      child: Transform.translate(
        offset: const Offset(0, 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            AuthDialogMessages.passwordResetDescription,
            style: AppTextStyles.body12.copyWith(color: AppColors.primaryGray),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
/// 新しいパスワード入力欄（ラベル + TextField + 表示切替）。
class _NewPasswordField extends StatefulWidget {
  const _NewPasswordField({required this.onChanged, required this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  State<_NewPasswordField> createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<_NewPasswordField> {
  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: '新しいパスワード',
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.next,
    );
  }
}

/// 新しいパスワード（再確認）入力欄（ラベル + TextField + 表示切替）。
class _NewPasswordConfirmField extends StatefulWidget {
  const _NewPasswordConfirmField({
    required this.onChanged,
    required this.errorText,
  });

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  State<_NewPasswordConfirmField> createState() =>
      _NewPasswordConfirmFieldState();
}

class _NewPasswordConfirmFieldState extends State<_NewPasswordConfirmField> {
  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: '新しいパスワード再確認',
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
    );
  }
}
