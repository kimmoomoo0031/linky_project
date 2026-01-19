import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_posts_result.dart';

/// ラウンジ投稿一覧を取得するユースケース。
class GetLoungePostsUseCase {
  GetLoungePostsUseCase(this._repository);

  final LoungeRepository _repository;

  Future<GetLoungePostsResult> call({
    required int loungeId,
    required int cursor,
    required int limit,
  }) async {
    try {
      final page = await _repository.getLoungePosts(
        loungeId: loungeId,
        cursor: cursor,
        limit: limit,
      );
      return GetLoungePostsResult.success(page);
    } catch (_) {
      return const GetLoungePostsResult.serverError();
    }
  }
}


