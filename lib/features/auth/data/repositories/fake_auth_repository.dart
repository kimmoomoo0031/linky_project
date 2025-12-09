import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_result.dart';
import '../../domain/usecases/register_result.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
///
/// ・特定のメール/パスワードの組み合わせのみ成功させる
/// ・その他は認証エラーとして Result で返す
/// ・新規登録も簡易的なモックレスポンスを返す
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
  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (email == _dummyUser.email && password == 'password123') {
      return LoginResult.success(_dummyUser);
    }

    // ひとまずその他のケースは「認証情報エラー」として扱う。
    return const LoginResult.invalidCredentials();
  }

  @override
  Future<RegisterResult> register({
    required String email,
    required String nickname,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    // 簡易モック:
    // - 特定のメールアドレスは「既に使用済み」とする
    if (email == _dummyUser.email) {
      return const RegisterResult.emailAlreadyUsed();
    }

    // それ以外は成功とみなす
    return const RegisterResult.success();
  }

  @override
  Future<void> logout() async {
    // ダミー実装なので特に何もしない
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}


