import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'password_reset_state.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/constants/common_dialog_messages.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';

/// パスワード再設定画面の入力値・バリデーション・ローディング状態を管理するコントローラ。
class PasswordResetController extends StateNotifier<PasswordResetState> {
  PasswordResetController(this._ref) : super(const PasswordResetState());

  final Ref _ref;

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(passwordResetDialogEventProvider.notifier).state = event;
  }

  bool _validateEmail() {
    final emailError = Validators.validateEmail(state.email);
    if (emailError != null) {
      state = state.copyWith(
        emailError: emailError,
      );
      return false;
    }
    return true;
  }

  Future<void> submit() async {
    if (state.isLoading) return;

    if (!_validateEmail()) return;

    state = state.copyWith(isLoading: true);

    try {
      // TODO(api): パスワード再設定メール送信 UseCase を呼び出す。
      // いまは UI 動作確認のためにダミーの待ち時間だけ入れている。
      await Future.delayed(const Duration(seconds: 1));

      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.info,
          message: AuthDialogMessages.resetEmailSent,
        ),
      );
    } catch (_) {
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonDialogMessages.unexpectedError,
        ),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}


