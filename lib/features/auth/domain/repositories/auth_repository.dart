import 'package:linky_project_0318/features/auth/domain/usecases/login_result.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/register_result.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_result.dart';

/// 認証系のドメインロジックが依存する抽象リポジトリ。
///
/// 具体的な実装（API 呼び出し、ローカルキャッシュなど）は data レイヤーに置く。
///
/// TODO(backend): /auth/refresh, /auth/register など、バックエンド設計が固まり次第
///                必要なメソッドをここに追加する。
abstract class AuthRepository {
  /// メールアドレス + パスワードでログイン。
  Future<LoginResult> login({
    required String email,
    required String password,
  });

  /// 新規登録。
  Future<RegisterResult> register({
    required String email,
    required String nickname,
    required String password,
  });

  /// ログアウト。
  Future<void> logout();

  /// パスワード再設定（認証コード確認後に新しいパスワードを設定する）。
  Future<ResetPasswordResult> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  });
}


