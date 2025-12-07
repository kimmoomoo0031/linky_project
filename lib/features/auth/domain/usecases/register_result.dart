import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result.freezed.dart';

/// 新規登録の結果を表すドメイン用 Union 型。
///
/// まだ Repository / UseCase には接続していないが、
/// ログインと同じパターンで扱えるように先に定義しておく。
@freezed
class RegisterResult with _$RegisterResult {
  /// 登録成功。
  const factory RegisterResult.success() = RegisterSuccess;

  /// すでに同じメールアドレスで登録済み。
  const factory RegisterResult.emailAlreadyUsed() = RegisterEmailAlreadyUsed;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory RegisterResult.networkError() = RegisterNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory RegisterResult.serverError() = RegisterServerError;
}


