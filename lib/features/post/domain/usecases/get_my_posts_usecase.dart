import 'package:linky_project_0318/features/post/domain/repositories/post_repository.dart';
import 'package:linky_project_0318/features/post/domain/usecases/get_my_posts_result.dart';

/// 自分の投稿一覧を取得するユースケース。
class GetMyPostsUseCase {
  GetMyPostsUseCase(this._repository);

  final PostRepository _repository;

  Future<GetMyPostsResult> call() async {
    try {
      final items = await _repository.getMyPosts();
      return GetMyPostsResult.success(items);
    } catch (_) {
      return const GetMyPostsResult.serverError();
    }
  }
}


