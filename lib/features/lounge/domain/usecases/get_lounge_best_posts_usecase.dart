import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_best_posts_result.dart';

/// ラウンジベスト投稿一覧を取得するユースケース。
class GetLoungeBestPostsUseCase {
  GetLoungeBestPostsUseCase(this._repository);

  final LoungeRepository _repository;

  Future<GetLoungeBestPostsResult> call({
    required int loungeId,
    required int cursor,
    required int limit,
  }) async {
    try {
      final page = await _repository.getBestPosts(
        loungeId: loungeId,
        cursor: cursor,
        limit: limit,
      );
      return GetLoungeBestPostsResult.success(page);
    } catch (_) {
      return const GetLoungeBestPostsResult.serverError();
    }
  }
}


