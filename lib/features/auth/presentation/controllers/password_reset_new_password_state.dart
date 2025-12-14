import 'package:freezed_annotation/freezed_annotation.dart';

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


