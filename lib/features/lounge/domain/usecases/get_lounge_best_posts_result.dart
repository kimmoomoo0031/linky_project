import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';

part 'get_lounge_best_posts_result.freezed.dart';

/// ラウンジベスト投稿一覧取得結果を表すドメイン用 Union 型。
@freezed
class GetLoungeBestPostsResult with _$GetLoungeBestPostsResult {
  /// 取得成功。
  const factory GetLoungeBestPostsResult.success(LoungePostPage page) =
      GetLoungeBestPostsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetLoungeBestPostsResult.networkError() =
      GetLoungeBestPostsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetLoungeBestPostsResult.serverError() =
      GetLoungeBestPostsServerError;
}


