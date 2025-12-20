import 'package:freezed_annotation/freezed_annotation.dart';

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


