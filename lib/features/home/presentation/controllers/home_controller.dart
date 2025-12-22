import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';
import 'package:linky_project_0318/features/home/domain/entities/home_user.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';
import 'package:linky_project_0318/features/home/home_exports.dart';

class HomeViewData {
  const HomeViewData({
    required this.me,
    required this.latestViewed,
    required this.latestHasNext,
    required this.bestPosts,
  });

  final HomeUser me;
  final List<LoungePreview> latestViewed;
  final bool latestHasNext;
  final List<BestPost> bestPosts;

  int get latestPageCount => (latestViewed.length / 6).ceil().clamp(1, 9999);
}

class HomeController extends AsyncNotifier<HomeViewData> {
  bool _isFetchingMoreLatest = false;

  @override
  Future<HomeViewData> build() async {
    final repo = ref.read(homeRepositoryProvider);

    final me = await repo.getMe();
    final latest = await repo.getLatestViewed(page: 1, pageSize: 12);
    final best = await repo.getBestPosts(limit: 10);

    return HomeViewData(
      me: me,
      latestViewed: latest.items,
      latestHasNext: latest.hasNext,
      bestPosts: best,
    );
  }

  Future<void> fetchMoreLatest() async {
    final current = state.valueOrNull;
    if (current == null) return;
    if (!current.latestHasNext) return;
    if (_isFetchingMoreLatest) return;
    _isFetchingMoreLatest = true;

    try {
      // 次ページ（1ページ = 6件）を読み込む。
      final nextPage = (current.latestViewed.length / 6).ceil() + 1;
      final repo = ref.read(homeRepositoryProvider);

      // すでに data を持っているので、全画面ローディングにはせずに裏で追加読み込みする。
      final next = await repo.getLatestViewed(page: nextPage, pageSize: 6);

      state = AsyncData(
        HomeViewData(
          me: current.me,
          latestViewed: [...current.latestViewed, ...next.items],
          latestHasNext: next.hasNext,
          bestPosts: current.bestPosts,
        ),
      );
    } finally {
      _isFetchingMoreLatest = false;
    }
  }
}


