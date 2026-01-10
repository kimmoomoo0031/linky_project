import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/utils/form_gate.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String email,
    @Default('') String nickname,
    @Default('') String password,
    @Default('') String passwordConfirm,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? emailError,
    String? nicknameError,
    String? passwordError,
    String? passwordConfirmError,
  }) = _RegisterState;
}

extension RegisterStateX on RegisterState {
  bool get canSubmit {
    final emailOk = Validators.validateEmail(email) == null;
    final nicknameOk = Validators.validateNickname(nickname) == null;
    final passwordOk = Validators.validatePassword(password) == null;
    final confirmOk = Validators.validatePasswordConfirmation(
          password: password,
          confirmation: passwordConfirm,
        ) ==
        null;

    return FormGate.canSubmit(
      isBusy: isLoading,
      conditions: [emailOk, nicknameOk, passwordOk, confirmOk],
    );
  }
}


