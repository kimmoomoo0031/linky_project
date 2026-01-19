import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';

part 'search_lounge_posts_result.freezed.dart';

/// ラウンジ内投稿検索結果を表すドメイン用 Union 型。
@freezed
class SearchLoungePostsResult with _$SearchLoungePostsResult {
  /// 取得成功。
  const factory SearchLoungePostsResult.success(LoungePostSearchPage page) =
      SearchLoungePostsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory SearchLoungePostsResult.networkError() =
      SearchLoungePostsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory SearchLoungePostsResult.serverError() =
      SearchLoungePostsServerError;
}


