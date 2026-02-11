import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'post_api_service.g.dart';

/// 投稿(Post) 関連の API クライアント。
@RestApi()
abstract class PostApiService {
  factory PostApiService(Dio dio, {String baseUrl}) = _PostApiService;

  /// 投稿詳細取得。
  @GET(ApiEndpoints.postDetailTemplate)
  Future<dynamic> getPostDetail(
    @Path('post_id') String postId,
  );

  /// ログインユーザーによる投稿作成。
  @POST(ApiEndpoints.postCreate)
  @MultiPart()
  Future<dynamic> createPost({
    @Part(name: 'title') required String title,
    @Part(name: 'content') required String content,
    @Part(name: 'lounge_id') required String loungeId,
    @Part(name: 'images') List<MultipartFile>? images,
  });

  /// ゲストによる投稿作成。
  @POST(ApiEndpoints.postCreateGuest)
  @MultiPart()
  Future<dynamic> createGuestPost({
    @Part(name: 'nickname') required String nickname,
    @Part(name: 'password') required String password,
    @Part(name: 'title') required String title,
    @Part(name: 'content') required String content,
    @Part(name: 'images') List<MultipartFile>? images,
  });

  /// 投稿の修正。
  @PUT(ApiEndpoints.postUpdateTemplate)
  Future<dynamic> updatePost(
    @Path('post_id') String postId,
    @Body() Map<String, dynamic> body,
  );

  /// 投稿の削除。
  @DELETE(ApiEndpoints.postDeleteTemplate)
  Future<void> deletePost(
    @Path('post_id') String postId,
  );

  /// いいね（おすすめ）。
  @POST(ApiEndpoints.postLikeTemplate)
  Future<void> likePost(
    @Path('post_id') String postId,
  );

  /// よくないね（非推薦）。
  @POST(ApiEndpoints.postDislikeTemplate)
  Future<void> dislikePost(
    @Path('post_id') String postId,
  );

  /// ベスト投稿一覧。
  @GET(ApiEndpoints.postsBest)
  Future<dynamic> getBestPosts({ // List<dynamic> → dynamic
    @Queries() Map<String, dynamic>? query, // limit など
  });
}

