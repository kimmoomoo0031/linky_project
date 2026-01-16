import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';
import 'package:linky_project_0318/features/home/domain/entities/home_user.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';
import 'package:linky_project_0318/core/export/home_exports.dart';
import 'package:linky_project_0318/core/constants/home_constants.dart';

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

  int get latestPageCount =>
      (latestViewed.length / HomeConstants.latestPageSize).ceil().clamp(1, 9999);
}

class HomeController extends AsyncNotifier<HomeViewData> {
  bool _isFetchingMoreLatest = false;
  final Set<int> _pendingDeleteLatestViewedIds = <int>{};

  @override
  Future<HomeViewData> build() async {
    final repo = ref.read(homeRepositoryProvider);

    final me = await repo.getMe();
    final latest = await repo.getLatestViewed(
      page: 1,
      pageSize: HomeConstants.initialLatestSize,
    );
    final best = await repo.getBestPosts(limit: HomeConstants.bestPostsLimit);

    return HomeViewData(
      me: me,
      latestViewed: latest.items,
      latestHasNext: false,
      bestPosts: best,
    );
  }

  HomeViewData _copyWithLatestViewed(
    HomeViewData base, {
    required List<LoungePreview> latestViewed,
  }) {
    return HomeViewData(
      me: base.me,
      latestViewed: latestViewed,
      latestHasNext: base.latestHasNext,
      bestPosts: base.bestPosts,
    );
  }

  /// 最新閲覧（最近閲覧）から指定のラウンジを削除する（optimistic）。
  ///
  /// - UIは先にリストから消し、失敗したら元に戻す
  /// - 失敗時は例外を throw して UI 側でスナックバー表示などを行う
  Future<void> removeLatestViewed({required int loungeId}) async {
    final prev = state.valueOrNull;
    if (prev == null) return;
    if (_pendingDeleteLatestViewedIds.contains(loungeId)) return;

    final removeIndex = prev.latestViewed.indexWhere((e) => e.id == loungeId);
    if (removeIndex < 0) return;

    _pendingDeleteLatestViewedIds.add(loungeId);
    final removedItem = prev.latestViewed[removeIndex];

    // optimistic: まずUIから即座に消す
    final nextList = [...prev.latestViewed]..removeAt(removeIndex);
    state = AsyncData(
      _copyWithLatestViewed(prev, latestViewed: nextList),
    );

    try {
      final repo = ref.read(homeRepositoryProvider);
      await repo.deleteLatestViewed(loungeId: loungeId);
    } catch (e) {
      // rollback: できるだけ「今の state」に差し戻す（fetchMore 等の差分を潰しにくくする）
      final cur = state.valueOrNull;
      if (cur == null) {
        state = AsyncData(prev);
      } else {
        final alreadyRestored = cur.latestViewed.any((x) => x.id == loungeId);
        if (!alreadyRestored) {
          final restored = [...cur.latestViewed];
          final idx = removeIndex.clamp(0, restored.length);
          restored.insert(idx, removedItem);
          state = AsyncData(
            _copyWithLatestViewed(cur, latestViewed: restored),
          );
        }
      }
      rethrow;
    } finally {
      _pendingDeleteLatestViewedIds.remove(loungeId);
    }
  }

  Future<void> fetchMoreLatest() async {
    final current = state.valueOrNull;
    if (current == null) return;
    if (!current.latestHasNext) return;
    // 安全策: 最大件数に達している場合は追加取得しない。
    if (current.latestViewed.length >= HomeConstants.latestMaxItems) return;
    if (_isFetchingMoreLatest) return;
    _isFetchingMoreLatest = true;

    try {
      // 次ページ（1ページ = 6件）を読み込む。
      final nextPage =
          (current.latestViewed.length / HomeConstants.latestPageSize).ceil() + 1;
      if (nextPage > HomeConstants.latestMaxPages) return;
      final repo = ref.read(homeRepositoryProvider);

      // すでに data を持っているので、全画面ローディングにはせずに裏で追加読み込みする。
      final next = await repo.getLatestViewed(
        page: nextPage,
        pageSize: HomeConstants.latestPageSize,
      );

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


