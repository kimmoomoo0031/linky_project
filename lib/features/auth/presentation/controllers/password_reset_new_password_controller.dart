import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/logged_action.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/error/common_messages.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_result.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/core/constants/auth_constants.dart';

import 'package:linky_project_0318/features/auth/presentation/states/password_reset_new_password_state.dart';

/// パスワード再設定の「新しいパスワード設定」画面用コントローラ。
///
/// ・入力値（新パスワード/確認）
/// ・バリデーション
/// ・送信中のローディング
/// ・全体エラー（ダイアログ）
/// を一元管理する。
class PasswordResetNewPasswordController
    extends StateNotifier<PasswordResetNewPasswordState> {
  PasswordResetNewPasswordController(this._ref, this._useCase)
      : super(const PasswordResetNewPasswordState());

  final Ref _ref;
  final ResetPasswordUseCase _useCase;

  void onNewPasswordChanged(String value) {
    state = state.copyWith(newPassword: value, newPasswordError: null);
  }

  void onNewPasswordConfirmChanged(String value) {
    state =
        state.copyWith(newPasswordConfirm: value, newPasswordConfirmError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(passwordResetNewPasswordDialogEventProvider.notifier).state = event;
  }

  bool _validateAll() {
    final passwordError = Validators.validatePassword(state.newPassword);
    final confirmError = Validators.validatePasswordConfirmation(
      password: state.newPassword,
      confirmation: state.newPasswordConfirm,
    );

    if (passwordError != null || confirmError != null) {
      state = state.copyWith(
        newPasswordError: passwordError,
        newPasswordConfirmError: confirmError,
      );
      return false;
    }
    return true;
  }

  Future<void> submit({
    required String email,
    required String code,
  }) async {
    return runLogged(
      feature: 'AUTH',
      action: 'passwordResetNewPassword.submit',
      fields: {
        'email': AppLog.maskEmail(email),
        'code': AppLog.maskSecret(),
        'newPassword': AppLog.maskSecret(),
      },
      blockReason: () {
        if (state.isLoading) return 'isLoading';
        if (!_validateAll()) return 'validation';
        return null;
      },
      blockFields: () => {
        'newPasswordError': state.newPasswordError,
        'newPasswordConfirmError': state.newPasswordConfirmError,
      },
      run: () async {
        state = state.copyWith(isLoading: true);
        try {
          final result = await _requestToServer(email: email, code: code);
          _handleResetPasswordResult(result);
        } finally {
          state = state.copyWith(isLoading: false);
        }
      },
      onException: (e, st) {
        _handleUnexpectedError();
      },
    );
  }

  /// 現在の入力値をもとにサーバーへリクエストを送り、ResetPasswordResult を返す。
  Future<ResetPasswordResult> _requestToServer({
    required String email,
    required String code,
  }) {
    return _useCase(
      email: email,
      code: code,
      newPassword: state.newPassword,
    );
  }

  /// ResetPasswordUseCase の結果に応じて state を更新する。
  void _handleResetPasswordResult(ResetPasswordResult result) {
    result.when(
      success: () {
        _emitDialog(
          const LinkyDialogEvent(
            type: LinkyDialogType.info,
            message: AuthConstants.resetPasswordSuccess,
          ),
        );
      },
      invalidCode: () {
        _emitDialog(
          const LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: AuthConstants.invalidResetCode,
          ),
        );
      },
      weakPassword: () {
        state = state.copyWith(
          newPasswordError: 'パスワードが弱すぎます。条件を満たすように入力してください。',
        );
      },
      networkError: () {
        _emitDialog(
            LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.network.message,
          ),
        );
      },
      serverError: () {
        _emitDialog(
            LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.errors.server.message,
          ),
        );
      },
    );
  }

  /// 想定外の例外発生時のエラーハンドリング。
  void _handleUnexpectedError() {
    _emitDialog(
        LinkyDialogEvent(
        type: LinkyDialogType.error,
        message: CommonMessages.errors.unexpected.message,
      ),
    );
  }
}


