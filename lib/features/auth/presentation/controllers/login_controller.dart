import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/login_usecase.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value, passwordError: null);
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
      //
      // TODO(api): LoginUseCase が AuthResult (success/invalidCredentials/...)
      //を返すようになったら、ここで result.when(...) で分岐する。
      await _loginUseCase(
        email: state.email.trim(),
        password: state.password,
      );
    } catch (e) {
      //API失敗時共通エラー (パスワード欄の下に出す例)
      // TODO(error): エラー種別ごとに文言を変えたい場合は、ドメイン例外 or Result 型に置き換える。
      state = state.copyWith(
        emailError: null,
        passwordError: 'メールアドレスまたはパスワードが正しくありません',
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
