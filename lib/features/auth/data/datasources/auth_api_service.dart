import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'auth_api_service.g.dart';

/// 認証系エンドポイントをまとめた Retrofit API クライアント。
///
/// ※ 現時点では Request/Response に Map を使った簡易版。
///    後で Freezed DTO を定義したら、型と引数を差し替えていく前提。
@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// メールアドレス・パスワード・ニックネームで新規登録（利用規約同意フラグ込み）。
  @POST(ApiEndpoints.authRegister)
  Future<dynamic> register(@Body() Map<String, dynamic> body);

  /// メールアドレス + パスワードでログイン。
  @POST(ApiEndpoints.authLogin)
  Future<dynamic> login(@Body() Map<String, dynamic> body);

  /// ログアウト（Refresh Token をサーバー側で無効化）。
  @POST(ApiEndpoints.authLogout)
  Future<void> logout(@Body() Map<String, dynamic> body);

  /// Refresh Token を用いた Access Token 再発行。
  @POST(ApiEndpoints.authRefresh)
  Future<dynamic> refresh(@Body() Map<String, dynamic> body);

  /// パスワードリセット用メール送信。
  @POST(ApiEndpoints.authPasswordForgot)
  Future<void> sendPasswordResetMail(@Body() Map<String, dynamic> body);

  /// 新しいパスワードを設定。
  @POST(ApiEndpoints.authPasswordReset)
  Future<void> resetPassword(@Body() Map<String, dynamic> body);

  /// メール認証コードの検証。
  @POST(ApiEndpoints.authVerifyEmail)
  Future<void> verifyEmail(@Body() Map<String, dynamic> body);

  /// LINE ログイン用コールバック。
  @POST(ApiEndpoints.authLineLogin)
  Future<dynamic> lineLogin(@Body() Map<String, dynamic> body);

  /// Google ログイン用コールバック。
  @POST(ApiEndpoints.authGoogleLogin)
  Future<dynamic> googleLogin(@Body() Map<String, dynamic> body);
}


