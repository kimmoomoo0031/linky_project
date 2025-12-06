// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// import 'package:linky_project_0318/core/constants/api_endpoints.dart';
//
// part 'admin_api_service.g.dart';
//
// /// 管理者向け機能の API クライアント。
// @RestApi()
// abstract class AdminApiService {
//   factory AdminApiService(Dio dio, {String baseUrl}) = _AdminApiService;
//
//   /// 投稿管理一覧。
//   @GET(ApiEndpoints.adminPosts)
//   Future<List<dynamic>> getAdminPosts();
//
//   /// 投稿管理詳細。
//   @GET(ApiEndpoints.adminPostDetailTemplate)
//   Future<Map<String, dynamic>> getAdminPostDetail(
//     @Path('post_id') String postId,
//   );
//
//   /// 管理者による投稿削除。
//   @DELETE(ApiEndpoints.adminPostDeleteTemplate)
//   Future<void> deleteAdminPost(
//     @Path('post_id') String postId,
//   );
//
//   /// すべてのラウンジ申請一覧。
//   @GET(ApiEndpoints.adminLoungeRequests)
//   Future<List<dynamic>> getLoungeRequests();
//
//   /// 特定ラウンジ申請の詳細。
//   @GET(ApiEndpoints.adminLoungeRequestDetailTemplate)
//   Future<Map<String, dynamic>> getLoungeRequestDetail(
//     @Path('id') String requestId,
//   );
//
//   /// ラウンジ申請を承認。
//   @POST(ApiEndpoints.adminLoungeRequestApproveTemplate)
//   Future<void> approveLoungeRequest(
//     @Path('id') String requestId,
//   );
//
//   /// ラウンジ申請を却下。
//   @POST(ApiEndpoints.adminLoungeRequestRejectTemplate)
//   Future<void> rejectLoungeRequest(
//     @Path('id') String requestId,
//   );
// }
//
//
