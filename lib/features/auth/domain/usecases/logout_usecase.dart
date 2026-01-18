import 'package:linky_project_0318/features/auth/domain/repositories/auth_repository.dart';

/// ログアウト処理を行うユースケース。
class LogoutUseCase {
  LogoutUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call() {
    return _repository.logout();
  }
}


