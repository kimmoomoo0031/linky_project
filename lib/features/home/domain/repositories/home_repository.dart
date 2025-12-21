import '../entities/best_post.dart';
import '../entities/home_user.dart';
import '../entities/lounge_preview.dart';

class LoungePreviewPage {
  const LoungePreviewPage({
    required this.items,
    required this.hasNext,
  });

  final List<LoungePreview> items;
  final bool hasNext;
}

abstract class HomeRepository {
  Future<HomeUser> getMe();

  /// 最新閲覧をページングで取得する。
  /// [page] は 1 始まり。
  Future<LoungePreviewPage> getLatestViewed({
    required int page,
    required int pageSize,
  });

  Future<List<BestPost>> getBestPosts({required int limit});
}


