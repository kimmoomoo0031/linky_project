import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/login_usecase.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/login_result.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/core/constants/common_dialog_messages.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._ref, this._loginUseCase) : super(const LoginState());

  final Ref _ref;
  final LoginUseCase _loginUseCase;

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(loginDialogEventProvider.notifier).state = event;
  }

  /// 全てのエラーメッセージをクリアする
  void _clearErrors() {
    state = state.copyWith(
      emailError: null,
      passwordError: null,
    );
  }

  Future<void> submit() async {
    if (state.isLoading) return;

    // 共通バリデーションを使う
    final emailError = Validators.validateEmail(state.email);
    final passwordError = Validators.validatePassword(state.password);

    if (emailError != null || passwordError != null) {
      state = state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
      );
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      // 実際API呼び出し (現在は FakeAuthRepository が応答)
      final LoginResult result = await _loginUseCase(
        email: state.email,
        password: state.password,
      );

      result.when(
        success: (user) {
          // TODO: 成功時 user をグローバルな AuthState などに保存し、画面遷移する。
          // この Controller ではとりあえずエラーをクリアするだけにしておく。
          _clearErrors();
        },
        invalidCredentials: () {
          // ユーザーが入力を修正できる種類のエラーはフィールド下に表示。
          state = state.copyWith(
            emailError: null,
            passwordError: 'メールアドレスまたはパスワードが正しくありません',
          );
        },
        networkError: () {
          _emitDialog(
            const LinkyDialogEvent(
              type: LinkyDialogType.error,
              message: CommonDialogMessages.networkError,
            ),
          );
        },
        serverError: () {
          _emitDialog(
            const LinkyDialogEvent(
              type: LinkyDialogType.error,
              message: CommonDialogMessages.serverError,
            ),
          );
        },
      );
    } catch (_) {
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonDialogMessages.unexpectedError,
        ),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
