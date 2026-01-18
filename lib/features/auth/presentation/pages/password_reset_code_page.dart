import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/export/auth_exports.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_code_state.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/otp_code_input.dart';

import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_code_controller.dart';

/// パスワード再設定の認証コード入力画面。
///
/// 前画面で入力したメールアドレス宛に送信された4桁コードを入力する。
class PasswordResetCodePage extends ConsumerStatefulWidget {
  const PasswordResetCodePage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  ConsumerState<PasswordResetCodePage> createState() =>
      _PasswordResetCodePageState();
}

class _PasswordResetCodePageState extends ConsumerState<PasswordResetCodePage> {
  final _otpKey = GlobalKey<OtpCodeInputState>();
  bool _isResending = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(passwordResetCodeControllerProvider);
    final controller =
        ref.read(passwordResetCodeControllerProvider.notifier);

    // ダイアログ表示イベントのリスナー（1回限り）。
    ref.listen(passwordResetCodeDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;

      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      controller.clearDialogEvent();
    });

    // 認証コード検証が成功したら「新しいパスワード設定」画面へ遷移する。
    ref.listen(passwordResetCodeControllerProvider, (previous, next) {
      if (previous?.isSuccess != true && next.isSuccess) {
        context.pushPasswordResetNewPassword(
          email: widget.email,
          code: next.combinedCode,
        );
      }
    });

    return Scaffold(
      appBar: const LinkyAppBar(
        title: '認証コード入力',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _PasswordResetCodeScrollContent(
              email: widget.email,
              state: state,
              controller: controller,
              otpKey: _otpKey,
              isResending: _isResending,
              onPressedResend: () async {
                setState(() => _isResending = true);
                final ok = await controller.resendEmail(email: widget.email);
                if (ok) {
                  _otpKey.currentState?.clear();
                  _otpKey.currentState?.focusFirst();
                }
                if (mounted) {
                  setState(() => _isResending = false);
                }
              },
              onTapBackToEmail: () => context.pop(),
              onPressedSubmit: () => controller.submit(email: widget.email),
            ),
            _CenterLoadingOverlay(isVisible: _isResending),
          ],
        ),
      ),
    );
  }
}

/// 認証コード入力画面のスクロール領域（本文）をまとめるクラス。
///
/// 画面内の各セクション（説明文、OTP入力、再送信、ヘルプリンク、送信ボタン）を配置する。
class _PasswordResetCodeScrollContent extends StatelessWidget {
  const _PasswordResetCodeScrollContent({
    required this.email,
    required this.state,
    required this.controller,
    required this.otpKey,
    required this.isResending,
    required this.onPressedResend,
    required this.onTapBackToEmail,
    required this.onPressedSubmit,
  });

  final String email;
  final PasswordResetCodeState state;
  final PasswordResetCodeController controller;
  final GlobalKey<OtpCodeInputState> otpKey;
  final bool isResending;
  final Future<void> Function() onPressedResend;
  final VoidCallback onTapBackToEmail;
  final VoidCallback onPressedSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          _ResetCodeNoticeText(email: email),
          const SizedBox(height: 32),
          _OtpInputSection(
            otpKey: otpKey,
            onChanged: controller.onCodeChanged,
            codeError: state.codeError,
          ),
          _ResendEmailButton(
            isDisabled: isResending || state.isLoading,
            onPressed: onPressedResend,
          ),
          const SizedBox(height: 8),
          _NoEmailHelpLink(onTapHere: onTapBackToEmail),
          const SizedBox(height: 24),
          AuthActionButton(
            label: '送信する',
            onPressed: (!isResending && state.canSubmit) ? onPressedSubmit : null,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            style: AuthActionButtonStyle.filled,
            isLoading: state.isLoading,
          ),
        ],
      ),
    );
  }
}

/// 「入力したメール宛に認証コードを送信した」旨を表示する説明テキスト用クラス。
class _ResetCodeNoticeText extends StatelessWidget {
  const _ResetCodeNoticeText({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Text(
      '入力したメールアドレス $email\n宛に認証コードを送信しました。',
      style: AppTextStyles.body14.copyWith(
        color: cs.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// 4桁のOTP入力欄と、入力エラー文言（赤文字）を表示するセクション用クラス。
///
/// エラーがある場合は、OTP入力欄の枠線もエラー色で表示する。
class _OtpInputSection extends StatelessWidget {
  const _OtpInputSection({
    required this.otpKey,
    required this.onChanged,
    required this.codeError,
  });

  final GlobalKey<OtpCodeInputState> otpKey;
  final void Function(int index, String value) onChanged;
  final String? codeError;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        OtpCodeInput(
          key: otpKey,
          length: 4,
          onChanged: onChanged,
          hasError: codeError != null,
        ),
        const SizedBox(height: 8),
        if (codeError != null) ...[
          Text(
            codeError!,
            style: AppTextStyles.body12.copyWith(color: cs.error),
          ),
        ],
      ],
    );
  }
}

/// 「メールを再送信する」ボタンを表示するクラス。
///
/// 再送信中や送信中など、[isDisabled] が true の場合は押せない状態にする。
class _ResendEmailButton extends StatelessWidget {
  const _ResendEmailButton({
    required this.isDisabled,
    required this.onPressed,
  });

  final bool isDisabled;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: isDisabled ? null : () => onPressed(),
        child: Text(
          'メールを再送信する',
          style: AppTextStyles.body12.copyWith(
            color: cs.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

/// 「メールが届かない場合は こちら をクリック」のヘルプリンク表示用クラス。
///
/// [onTapHere] で「こちら」タップ時の遷移（例：前画面へ戻る）を実行する。
class _NoEmailHelpLink extends StatelessWidget {
  const _NoEmailHelpLink({required this.onTapHere});

  final VoidCallback onTapHere;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.body12.copyWith(
            color: cs.onSurfaceVariant,
          ),
          children: [
            const TextSpan(text: 'メールが届かない場合は'),
            TextSpan(
              text: 'こちら',
              style: AppTextStyles.body12.copyWith(
                color: cs.primary,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapHere,
            ),
            const TextSpan(text: 'をクリック'),
          ],
        ),
      ),
    );
  }
}

/// 画面中央にローディングを表示し、背後の操作を無効化するオーバーレイ用クラス。
///
/// 例：メール再送信中など、画面全体をブロックしたい場合に使用する。
class _CenterLoadingOverlay extends StatelessWidget {
  const _CenterLoadingOverlay({required this.isVisible});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final cs = Theme.of(context).colorScheme;
    return Stack(
      children: [
        ModalBarrier(dismissible: false, color: cs.scrim.withAlpha(107)), // 0.42 * 255 ≒ 107
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
