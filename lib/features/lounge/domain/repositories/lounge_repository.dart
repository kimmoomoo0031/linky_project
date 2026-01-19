import 'package:linky_project_0318/features/lounge/domain/entities/lounge_info.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_post_search_item.dart';
import 'package:linky_project_0318/core/enums/lounge_post_search_target.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_search_item.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

class LoungePostPage {
  const LoungePostPage({
    required this.items,
    required this.hasNext,
  });

  final List<MyPost> items;
  final bool hasNext;
}

class LoungeSearchPage {
  const LoungeSearchPage({
    required this.items,
    required this.totalCount,
    required this.hasNext,
  });

  final List<LoungeSearchItem> items;
  final int totalCount;
  final bool hasNext;
}

class LoungePostSearchPage {
  const LoungePostSearchPage({
    required this.items,
    required this.totalCount,
    required this.hasNext,
  });

  final List<LoungePostSearchItem> items;
  final int totalCount;
  final bool hasNext;
}

abstract class LoungeRepository {
  Future<LoungeInfo> getLoungeInfo({required int loungeId});

  Future<LoungePostPage> getLoungePosts({
    required int loungeId,
    required int cursor,
    required int limit,
  });

  Future<LoungePostPage> getBestPosts({
    required int loungeId,
    required int cursor,
    required int limit,
  });

  Future<LoungeSearchPage> searchLounges({
    required String query,
    required int cursor,
    required int limit,
  });

  Future<LoungePostSearchPage> searchLoungePosts({
    required String query,
    required LoungePostSearchTarget target,
    required int cursor,
    required int limit,
  });
}


