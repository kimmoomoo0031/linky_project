import 'package:linky_project_0318/features/auth/domain/repositories/auth_repository.dart';
import 'register_result.dart';

/// 新規登録用ユースケース。
///
/// UI 層 / Controller からはリポジトリの存在を意識せず、このクラスだけを呼び出す。
class RegisterUseCase {
  RegisterUseCase(this._repository);

  final AuthRepository _repository;

  Future<RegisterResult> call({
    required String email,
    required String nickname,
    required String password,
  }) {
    return _repository.register(
      email: email,
      nickname: nickname,
      password: password,
    );
  }
}


