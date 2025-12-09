import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';

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

    /// フィールド単位ではなく、ダイアログなどで表示したい全体エラー文言。
    String? generalErrorMessage,
    /// 全体エラー文言に対応するダイアログのタイプ。
    LinkyDialogType? generalErrorType,
  }) = _RegisterState;
}

