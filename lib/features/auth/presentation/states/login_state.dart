import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/utils/form_gate.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}

extension LoginStateX on LoginState {
  bool get canSubmit {
    final emailOk = Validators.validateEmail(email) == null;
    final passwordOk = password.trim().isNotEmpty;
    return FormGate.canSubmit(
      isBusy: isLoading,
      conditions: [emailOk, passwordOk],
    );
  }
}


