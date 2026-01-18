import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

part 'get_my_posts_result.freezed.dart';

/// 自分の投稿一覧取得結果を表すドメイン用 Union 型。
@freezed
class GetMyPostsResult with _$GetMyPostsResult {
  /// 取得成功。
  const factory GetMyPostsResult.success(List<MyPost> items) = GetMyPostsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetMyPostsResult.networkError() = GetMyPostsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetMyPostsResult.serverError() = GetMyPostsServerError;
}


