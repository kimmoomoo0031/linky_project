import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/auth/domain/entities/auth_user.dart';

part 'login_result.freezed.dart';

/// ログイン結果を表すドメイン用 Union 型。
///
/// UI / Controller 側では、この型に対して when(...) で分岐するだけにして、
/// 例外や生のステータスコードには直接触れないようにする。
@freezed
class LoginResult with _$LoginResult {
  /// ログイン成功。認証済みユーザー情報を返す。
  const factory LoginResult.success(AuthUser user) = LoginSuccess;

  /// メールアドレス or パスワードが間違っている。
  const factory LoginResult.invalidCredentials() = LoginInvalidCredentials;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory LoginResult.networkError() = LoginNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory LoginResult.serverError() = LoginServerError;
}


