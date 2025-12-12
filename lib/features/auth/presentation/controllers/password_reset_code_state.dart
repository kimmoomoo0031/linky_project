import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';

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
    String? generalErrorMessage,
    LinkyDialogType? generalErrorType,
  }) = _PasswordResetCodeState;
}

extension PasswordResetCodeStateX on PasswordResetCodeState {
  /// 4つの桁を連結した認証コード。
  String get combinedCode => '$code1$code2$code3$code4';
}