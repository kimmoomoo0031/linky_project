import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/utils/form_gate.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

part 'password_reset_new_password_state.freezed.dart';

/// パスワード再設定の「新しいパスワード設定」画面で利用する State。
@freezed
class PasswordResetNewPasswordState with _$PasswordResetNewPasswordState {
  const factory PasswordResetNewPasswordState({
    @Default('') String newPassword,
    @Default('') String newPasswordConfirm,
    @Default(false) bool isLoading,
    String? newPasswordError,
    String? newPasswordConfirmError,
  }) = _PasswordResetNewPasswordState;
}

extension PasswordResetNewPasswordStateX on PasswordResetNewPasswordState {
  bool get canSubmit {
    final passwordOk = Validators.validatePassword(newPassword) == null;
    final confirmOk = Validators.validatePasswordConfirmation(
          password: newPassword,
          confirmation: newPasswordConfirm,
        ) ==
        null;

    return FormGate.canSubmit(
      isBusy: isLoading,
      conditions: [passwordOk, confirmOk],
    );
  }
}


