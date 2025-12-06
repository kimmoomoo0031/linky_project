import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'user_api_service.g.dart';

/// ユーザー / マイページ関連の API クライアント。
@RestApi()
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  /// 自分のプロフィール情報を取得。
  @GET(ApiEndpoints.usersMe)
  Future<dynamic> getMe();

  /// 自分のプロフィールを更新。
  @PUT(ApiEndpoints.usersMe)
  Future<dynamic> updateMe(@Body() Map<String, dynamic> body);

  /// 自分が投稿した記事一覧を取得。
  @GET(ApiEndpoints.usersMePosts)
  Future<dynamic> getMyPosts();
}

