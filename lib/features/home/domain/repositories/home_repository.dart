import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';
import 'package:linky_project_0318/features/home/domain/entities/home_user.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';

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
  Future<LoungePreviewPage> getLatestViewed({
    required int page,
    required int pageSize,
  });

  /// 最新閲覧（最近閲覧）から指定したラウンジを削除する。
  ///
  /// - サーバー側は `DELETE /lounges/recent/{loungeId}` を想定（冪等）。
  Future<void> deleteLatestViewed({required int loungeId});

  Future<List<BestPost>> getBestPosts({required int limit});
}


