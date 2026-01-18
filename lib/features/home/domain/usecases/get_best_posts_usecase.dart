import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_best_posts_result.dart';

/// ベスト投稿一覧を取得するユースケース。
class GetBestPostsUseCase {
  GetBestPostsUseCase(this._repository);

  final HomeRepository _repository;

  Future<GetBestPostsResult> call({required int limit}) async {
    try {
      final items = await _repository.getBestPosts(limit: limit);
      return GetBestPostsResult.success(items);
    } catch (_) {
      return const GetBestPostsResult.serverError();
    }
  }
}


