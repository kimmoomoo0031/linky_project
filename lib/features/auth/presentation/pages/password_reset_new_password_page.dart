import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/constants/auth_constants.dart';

import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/core/widgets/linky_info_box.dart';
import 'package:linky_project_0318/features/auth/auth_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_new_password_state.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
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
    // 成功時（info）は成功画面へ遷移する（スタック整理のため go を使う）。
    ref.listen(passwordResetNewPasswordDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;

      if (event.type == LinkyDialogType.info) {
        // 成功時はダイアログを出さず、完了画面へ遷移する。
        ref.read(passwordResetNewPasswordDialogEventProvider.notifier).state = null;
        if (context.mounted) {
          context.goPasswordResetSuccess();
        }
        return;
      }

      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      ref.read(passwordResetNewPasswordDialogEventProvider.notifier).state = null;
    });

    return Scaffold(
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
    final cs = Theme.of(context).colorScheme;
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
            onPressed: state.canSubmit ? onPressedSubmit : null,
            backgroundColor: cs.primary,
            textColor: cs.onPrimary,
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
    return const LinkyInfoBox(
      text: AuthConstants.passwordResetDescription,
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
