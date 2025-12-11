import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';

part 'password_reset_state.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState({
    @Default('') String email,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,

    String? emailError,

    /// フィールド単位ではなく、ダイアログなどで表示したい全体メッセージ。
    String? generalErrorMessage,

    /// 全体メッセージに対応するダイアログのタイプ。
    LinkyDialogType? generalErrorType,
  }) = _PasswordResetState;
}


