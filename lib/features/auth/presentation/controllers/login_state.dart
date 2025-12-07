import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,

    String? emailError,
    String? passwordError,

    /// フィールド単位ではなく、ダイアログなどで表示したい全体エラー文言。
    String? generalErrorMessage,

    /// 全体エラー文言に対応するダイアログのタイプ。
    LinkyDialogType? generalErrorType,
  }) = _LoginState;
}
