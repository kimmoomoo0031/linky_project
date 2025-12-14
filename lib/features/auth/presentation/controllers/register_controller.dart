import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'register_state.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/core/constants/common_dialog_messages.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/register_usecase.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/register_result.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';

/// 新規登録画面の入力値・バリデーション・ローディング状態を管理するコントローラ。
///
/// RegisterUseCase を通じて Repository と通信し、結果は RegisterResult で受け取る。
class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this._ref, this._registerUseCase) : super(const RegisterState());

  final Ref _ref;
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

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(registerDialogEventProvider.notifier).state = event;
  }

  /// 全てのエラーメッセージをクリアする。
  void _clearErrors() {
    state = state.copyWith(
      emailError: null,
      nicknameError: null,
      passwordError: null,
      passwordConfirmError: null,
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
        );
      },
      networkError: () {
        state = state.copyWith(isSuccess: false);
        _emitDialog(
          const LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonDialogMessages.networkError,
          ),
        );
      },
      serverError: () {
        state = state.copyWith(isSuccess: false);
        _emitDialog(
          const LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonDialogMessages.serverError,
          ),
        );
      },
    );
  }

  /// 想定外の例外発生時のエラーハンドリング。
  void _handleUnexpectedError() {
    state = state.copyWith(
      isSuccess: false,
    );
    _emitDialog(
      const LinkyDialogEvent(
        type: LinkyDialogType.error,
        message: CommonDialogMessages.unexpectedError,
      ),
    );
  }
}
