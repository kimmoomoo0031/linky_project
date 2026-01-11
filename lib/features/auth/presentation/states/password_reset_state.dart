import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/utils/form_gate.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

part 'password_reset_state.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState({
    @Default('') String email,
    @Default(false) bool isLoading,
    String? emailError,
  }) = _PasswordResetState;
}

extension PasswordResetStateX on PasswordResetState {
  bool get canSubmit {
    final emailOk = Validators.validateEmail(email) == null;
    return FormGate.canSubmit(
      isBusy: isLoading,
      conditions: [emailOk],
    );
  }
}


