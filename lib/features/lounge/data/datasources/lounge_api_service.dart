import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'lounge_api_service.g.dart';

/// ラウンジ関連の API クライアント。
@RestApi()
abstract class LoungeApiService {
  factory LoungeApiService(Dio dio, {String baseUrl}) = _LoungeApiService;

  /// ホーム画面に表示するラウンジカード一覧。
  @GET(ApiEndpoints.lounges)
  Future<dynamic> getLounges(); // List<dynamic> → dynamic

  /// 最近閲覧したラウンジ一覧。
  @GET(ApiEndpoints.loungesRecent)
  Future<dynamic> getRecentLounges(); // List<dynamic> → dynamic

  /// ラウンジ詳細。
  @GET(ApiEndpoints.loungeDetailTemplate)
  Future<dynamic> getLoungeDetail(
    @Path('lounge_id') String loungeId,
  );

  /// ラウンジ内の投稿一覧。
  @GET(ApiEndpoints.loungePostsTemplate)
  Future<dynamic> getLoungePosts( // List<dynamic> → dynamic
    @Path('lounge_id') String loungeId, {
    @Queries() Map<String, dynamic>? query, // q, target, sort など
  });

  /// 一般ユーザーによるラウンジ作成申請。
  /// (旧 LoungeRequestApiService から統合)
  @POST(ApiEndpoints.loungeRequests)
  Future<dynamic> createLoungeRequest(
    @Body() Map<String, dynamic> body,
  );
}

