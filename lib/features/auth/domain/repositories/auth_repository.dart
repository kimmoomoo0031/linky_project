import '../entities/auth_user.dart';

/// 認証系のドメインロジックが依存する抽象リポジトリ。
///
/// 具体的な実装（API 呼び出し、ローカルキャッシュなど）は data レイヤーに置く。
///
/// TODO(backend): /auth/refresh, /auth/register など、バックエンド設計が固まり次第
///                必要なメソッドをここに追加する。
abstract class AuthRepository {
  /// メールアドレス + パスワードでログイン。
  Future<AuthUser> login({
    required String email,
    required String password,
  });

  /// ログアウト。
  Future<void> logout();
}


