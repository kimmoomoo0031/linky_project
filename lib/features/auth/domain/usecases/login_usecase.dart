import '../repositories/auth_repository.dart';
import 'login_result.dart';

/// ログイン用ユースケース。
///
/// UI 層 / Controller からはリポジトリの存在を意識せず、このクラスだけを呼び出す。
///
/// TODO(api): 将来的に AuthResult (success / invalidCredentials / networkError ...)
///            のような Union 型を返すように変更し、Controller 側で when で分岐させる。
class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<LoginResult> call({
    required String email,
    required String password,
  }) {
    /// TODO ステータスコードが決まったら以下のようにする
    return _repository.login(email: email.trim(), password: password.trim());
  }
}
/*
 try {
      final response = await _repository.login(email: email.trim(), password: password.trim());

      switch (response.statusCode) {
        case 200:
          return LoginResult.success(response.data);
        case 401:
          return LoginResult.invalidCredentials();
        case 500:
          return LoginResult.serverError();
        default:
          return LoginResult.unknownError();
      }
    } catch (e) {
      return LoginResult.networkError();
    }
 */


