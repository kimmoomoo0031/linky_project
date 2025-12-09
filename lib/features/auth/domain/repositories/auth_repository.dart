import '../entities/auth_user.dart';
import '../usecases/login_result.dart';
import '../usecases/register_result.dart';

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
}


