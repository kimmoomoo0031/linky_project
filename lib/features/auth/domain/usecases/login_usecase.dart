import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

/// ログイン用ユースケース。
///
/// UI 層 / Controller からはリポジトリの存在を意識せず、このクラスだけを呼び出す。
///
/// TODO(api): 将来的に AuthResult (success / invalidCredentials / networkError ...)
///            のような Union 型を返すように変更し、Controller 側で when で分岐させる。
class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthUser> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}


