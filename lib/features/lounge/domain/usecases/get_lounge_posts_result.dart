import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';

part 'get_lounge_posts_result.freezed.dart';

/// ラウンジ投稿一覧取得結果を表すドメイン用 Union 型。
@freezed
class GetLoungePostsResult with _$GetLoungePostsResult {
  /// 取得成功。
  const factory GetLoungePostsResult.success(LoungePostPage page) =
      GetLoungePostsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetLoungePostsResult.networkError() =
      GetLoungePostsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetLoungePostsResult.serverError() =
      GetLoungePostsServerError;
}


