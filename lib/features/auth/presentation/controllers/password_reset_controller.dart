import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/logged_action.dart';

import 'package:linky_project_0318/features/auth/presentation/states/password_reset_state.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/core/constants/auth_constants.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';


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
    return runLogged(
      feature: 'AUTH',
      action: 'passwordReset.submit',
      fields: {
        'email': AppLog.maskEmail(state.email),
      },
      blockReason: () {
        if (state.isLoading) return 'isLoading';
        if (!_validateEmail()) return 'validation';
        return null;
      },
      blockFields: () => {
        'error': state.emailError,
      },
      run: () async {
        state = state.copyWith(isLoading: true);
        try {
          // TODO(api): パスワード再設定メール送信 UseCase を呼び出す。
          // いまは UI 動作確認のためにダミーの待ち時間だけ入れている。
          await Future.delayed(const Duration(seconds: 1));

          _emitDialog(
            const LinkyDialogEvent(
              type: LinkyDialogType.info,
              message: AuthConstants.resetEmailSent,
            ),
          );
        } finally {
          state = state.copyWith(isLoading: false);
        }
      },
      onException: (e, st) {
        _emitDialog(
            LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.unexpected.message,
          ),
        );
      },
    );
  }
}


