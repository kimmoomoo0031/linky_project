import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/auth/presentation/states/login_state.dart';
import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/logged_action.dart';
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
    state = state.copyWith(email: value, emailError: null, isSuccess: false);
  }

  void onPasswordChanged(String value) {
    state =
        state.copyWith(password: value, passwordError: null, isSuccess: false);
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

  /// 画面遷移などのタイミングで、バリデーションエラー表示だけを消したい時に呼ぶ。
  ///（入力値は保持する）
  void clearValidationErrors() => _clearErrors();

  Future<void> submit() async {
    return runLogged(
      feature: 'AUTH',
      action: 'login.submit',
      fields: {
        'email': AppLog.maskEmail(state.email),
        'password': AppLog.maskSecret(),
      },
      blockReason: () {
        if (state.isLoading) return 'isLoading';

        // 共通バリデーションを使う
        final emailError = Validators.validateEmail(state.email);
        final passwordError = Validators.validatePassword(state.password);
        if (emailError != null || passwordError != null) {
          state = state.copyWith(
            emailError: emailError,
            passwordError: passwordError,
          );
          return 'validation';
        }
        return null;
      },
      blockFields: () => {
        'emailError': state.emailError,
        'passwordError': state.passwordError,
      },
      run: () async {
        state = state.copyWith(isLoading: true, isSuccess: false);
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
              state = state.copyWith(isSuccess: true);
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
        } finally {
          state = state.copyWith(isLoading: false);
        }
      },
      onException: (e, st) {
        _emitDialog(
          const LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonDialogMessages.unexpectedError,
          ),
        );
      },
    );
  }
}
