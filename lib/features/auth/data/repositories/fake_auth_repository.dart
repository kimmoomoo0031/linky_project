import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
///
/// ・特定のメール/パスワードの組み合わせのみ成功させる
/// ・その他は認証エラーとして Exception を投げる
///
/// TODO(api): 本番接続時には、このクラスを削除 or テスト専用に移動し、
/// Dio + Retrofit を使った AuthRepositoryImpl に差し替える。
class FakeAuthRepository implements AuthRepository {
  static const AuthUser _dummyUser = AuthUser(
    id: 1,
    nickname: 'Linky テストユーザー',
    email: 'test@linky.example',
    role: 'user',
    isGuest: false,
  );

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {

    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (email == _dummyUser.email && password == 'password123') {
      return _dummyUser;
    }

    throw Exception('INVALID_CREDENTIALS');
  }

  @override
  Future<void> logout() async {
    // ダミー実装なので特に何もしない
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}


