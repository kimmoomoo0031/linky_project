import 'package:linky_project_0318/features/auth/domain/repositories/auth_repository.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_result.dart';

/// パスワード再設定（新しいパスワードを設定する）ユースケース。
class ResetPasswordUseCase {
  ResetPasswordUseCase(this._repo);

  final AuthRepository _repo;

  Future<ResetPasswordResult> call({
    required String email,
    required String code,
    required String newPassword,
  }) {
    // UI ではなくユースケース側で入力を正規化する。
    return _repo.resetPassword(
      email: email.trim(),
      code: code.trim(),
      newPassword: newPassword,
    );
  }
}


