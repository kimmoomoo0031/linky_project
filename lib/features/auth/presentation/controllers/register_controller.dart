import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'register_state.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/register_usecase.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/register_result.dart';

/// 新規登録画面の入力値・バリデーション・ローディング状態を管理するコントローラ。
///
/// RegisterUseCase を通じて Repository と通信し、結果は RegisterResult で受け取る。
class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this._registerUseCase) : super(const RegisterState());

  final RegisterUseCase _registerUseCase;

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void onNicknameChanged(String value) {
    state = state.copyWith(nickname: value, nicknameError: null);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

  void onPasswordConfirmChanged(String value) {
    state = state.copyWith(passwordConfirm: value, passwordConfirmError: null);
  }

  /// ダイアログ表示後などに全体エラーをリセットするためのヘルパー。
  void clearGeneralError() {
    state = state.copyWith(
      generalErrorMessage: null,
      generalErrorType: null,
    );
  }

  /// 全てのエラーメッセージをクリアする。
  void _clearErrors() {
    state = state.copyWith(
      emailError: null,
      nicknameError: null,
      passwordError: null,
      passwordConfirmError: null,
      generalErrorMessage: null,
      generalErrorType: null,
    );
  }

  /// 全ての入力値を検証し、エラーがあれば state に反映して false を返す。
  /// 問題なければ true を返す。
  bool _validateAll() {
    final emailError = Validators.validateEmail(state.email);
    final passwordError = Validators.validatePassword(state.password);
    final nicknameError = Validators.validateNickname(state.nickname);
    final passwordConfirmError = Validators.validatePasswordConfirmation(
      password: state.password,
      confirmation: state.passwordConfirm,
    );

    if (emailError != null ||
        passwordError != null ||
        nicknameError != null ||
        passwordConfirmError != null) {
      state = state.copyWith(
        isSuccess: false,
        emailError: emailError,
        passwordError: passwordError,
        nicknameError: nicknameError,
        passwordConfirmError: passwordConfirmError,
      );
      return false;
    }

    return true;
  }

  Future<void> submit() async {
    if (state.isLoading) return;

    if (!_validateAll()) return;

    state = state.copyWith(isLoading: true);

    try {
      final result = await _requestToServer();
      _handleRegisterResult(result);
    } catch (_) {
      _handleUnexpectedError();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 現在の入力値をもとにサーバーへリクエストを送り、RegisterResult を返す。
  Future<RegisterResult> _requestToServer() {
    return _registerUseCase(
      email: state.email,
      nickname: state.nickname,
      password: state.password,
    );
  }

  /// RegisterUseCase の結果に応じて state を更新する。
  void _handleRegisterResult(RegisterResult result) {
    result.when(
      success: () {
        // 成功時はいったん全てのエラーをクリア。
        _clearErrors();
        state = state.copyWith(isSuccess: true);
      },
      emailAlreadyUsed: () {
        // 既に利用されているメールアドレス → フィールドエラーとして表示。
        state = state.copyWith(
          isSuccess: false,
          emailError: 'このメールアドレスはすでに登録されています',
          generalErrorMessage: null,
          generalErrorType: null,
        );
      },
      networkError: () {
        state = state.copyWith(
          isSuccess: false,
          generalErrorMessage:
              'ネットワークエラーが発生しました。\n通信状況を確認してから、もう一度お試しください。',
          generalErrorType: LinkyDialogType.error,
        );
      },
      serverError: () {
        state = state.copyWith(
          isSuccess: false,
          generalErrorMessage:
              'サーバーエラーが発生しました。\nしばらく時間をおいて再度お試しください。',
          generalErrorType: LinkyDialogType.error,
        );
      },
    );
  }

  /// 想定外の例外発生時のエラーハンドリング。
  void _handleUnexpectedError() {
    state = state.copyWith(
      isSuccess: false,
      generalErrorMessage:
          '登録に失敗しました。\n時間をおいて再度お試しください。',
      generalErrorType: LinkyDialogType.error,
    );
  }
}
