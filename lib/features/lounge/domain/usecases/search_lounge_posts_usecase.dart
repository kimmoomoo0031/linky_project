import 'package:linky_project_0318/core/enums/lounge_post_search_target.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounge_posts_result.dart';

/// ラウンジ内投稿検索を行うユースケース。
class SearchLoungePostsUseCase {
  SearchLoungePostsUseCase(this._repository);

  final LoungeRepository _repository;

  Future<SearchLoungePostsResult> call({
    required String query,
    required LoungePostSearchTarget target,
    required int cursor,
    required int limit,
  }) async {
    try {
      final page = await _repository.searchLoungePosts(
        query: query,
        target: target,
        cursor: cursor,
        limit: limit,
      );
      return SearchLoungePostsResult.success(page);
    } catch (_) {
      return const SearchLoungePostsResult.serverError();
    }
  }
}


