import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_result.freezed.dart';

/// パスワード再設定（新しいパスワード設定）の結果を表す Union。
@freezed
class ResetPasswordResult with _$ResetPasswordResult {
  const factory ResetPasswordResult.success() = ResetPasswordSuccess;

  /// 認証コードが無効/期限切れ等。
  const factory ResetPasswordResult.invalidCode() = ResetPasswordInvalidCode;

  /// サーバー側の要件でパスワードが弱いと判定された場合。
  const factory ResetPasswordResult.weakPassword() = ResetPasswordWeakPassword;

  const factory ResetPasswordResult.networkError() = ResetPasswordNetworkError;
  const factory ResetPasswordResult.serverError() = ResetPasswordServerError;
}


