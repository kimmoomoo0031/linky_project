import 'package:linky_project_0318/features/auth/domain/repositories/auth_repository.dart';
import 'login_result.dart';

/// ログイン用ユースケース。
///
/// UI 層 / Controller からはリポジトリの存在を意識せず、このクラスだけを呼び出す。
///
/// TODO(api): API 接続時にステータスコード等で Result の分岐を調整する。
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

