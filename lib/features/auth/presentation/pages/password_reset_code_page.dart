import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/otp_code_input.dart';

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

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(
        title: '認証コード入力',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    '入力したメールアドレス ${widget.email}\n宛に認証コードを送信しました。',
                    style: AppTextStyles.body14.copyWith(
                      color: AppColors.primaryGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  OtpCodeInput(
                    key: _otpKey,
                    length: 4,
                    onChanged: controller.onCodeChanged,
                    hasError: state.codeError != null,
                  ),
                  const SizedBox(height: 8),
                  if (state.codeError != null) ...[
                    Text(
                      state.codeError!,
                      style: AppTextStyles.body12.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ],
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (_isResending || state.isLoading)
                          ? null
                          : () async {
                              setState(() => _isResending = true);
                              final ok = await controller.resendEmail(
                                email: widget.email,
                              );
                              if (ok) {
                                _otpKey.currentState?.clear();
                                _otpKey.currentState?.focusFirst();
                              }
                              if (mounted) {
                                setState(() => _isResending = false);
                              }
                            },
                      child: Text(
                        'メールを再送信する',
                        style: AppTextStyles.body12.copyWith(
                          color: AppColors.primaryActionBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.body12.copyWith(
                          color: AppColors.primaryGray,
                        ),
                        children: [
                          const TextSpan(text: 'メールが届かない場合は'),
                          TextSpan(
                            text: 'こちら',
                            style: AppTextStyles.body12.copyWith(
                              color: AppColors.primaryActionBlue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                          const TextSpan(text: 'をクリック'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AuthActionButton(
                    label: '送信する',
                    onPressed: () => controller.submit(email: widget.email),
                    backgroundColor: AppColors.loginButton,
                    textColor: AppColors.primaryWhite,
                    style: AuthActionButtonStyle.filled,
                    isLoading: state.isLoading,
                  ),
                ],
              ),
            ),
            if (_isResending) ...[
              const ModalBarrier(dismissible: false, color: AppColors.indicatorBackground),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
