import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';

part 'get_best_posts_result.freezed.dart';

/// ベスト投稿取得結果を表すドメイン用 Union 型。
@freezed
class GetBestPostsResult with _$GetBestPostsResult {
  /// 取得成功。
  const factory GetBestPostsResult.success(List<BestPost> items) =
      GetBestPostsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetBestPostsResult.networkError() = GetBestPostsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetBestPostsResult.serverError() = GetBestPostsServerError;
}


