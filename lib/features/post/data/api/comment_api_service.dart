import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'comment_api_service.g.dart';

/// コメント関連の API クライアント。
@RestApi()
abstract class CommentApiService {
  factory CommentApiService(Dio dio, {String baseUrl}) = _CommentApiService;

  /// コメント一覧取得。
  @GET(ApiEndpoints.postCommentsTemplate)
  Future<dynamic> getComments(
    @Path('post_id') String postId, {
    @Queries() Map<String, dynamic>? query, // sort など
  });

  /// ログインユーザーによるコメント作成。
  @POST(ApiEndpoints.postCommentsTemplate)
  Future<dynamic> createComment(
    @Path('post_id') String postId,
    @Body() Map<String, dynamic> body,
  );

  /// ゲストによるコメント作成。
  @POST(ApiEndpoints.postCommentsGuestTemplate)
  Future<dynamic> createGuestComment(
    @Path('post_id') String postId,
    @Body() Map<String, dynamic> body,
  );

  /// コメント削除。
  @DELETE(ApiEndpoints.commentDeleteTemplate)
  Future<void> deleteComment(
    @Path('comment_id') String commentId,
  );
}


