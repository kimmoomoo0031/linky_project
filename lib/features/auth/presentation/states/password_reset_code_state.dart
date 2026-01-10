import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/utils/form_gate.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

part 'password_reset_code_state.freezed.dart';

@freezed
class PasswordResetCodeState with _$PasswordResetCodeState {
  const factory PasswordResetCodeState({
    @Default('') String code1,
    @Default('') String code2,
    @Default('') String code3,
    @Default('') String code4,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? codeError,
  }) = _PasswordResetCodeState;
}

extension PasswordResetCodeStateX on PasswordResetCodeState {
  /// 4つの桁を連結した認証コード。
  String get combinedCode => '$code1$code2$code3$code4';

  bool get canSubmit {
    final otpOk = Validators.validateOtpCode(combinedCode, length: 4) == null;
    return FormGate.canSubmit(
      isBusy: isLoading,
      conditions: [otpOk],
    );
  }
}


