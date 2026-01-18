import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_post_search_item.dart';
import 'package:linky_project_0318/core/enums/lounge_post_search_target.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounge_posts_result.dart';

/// ラウンジ内投稿検索画面向けの表示データ。
class LoungePostSearchViewData {
  const LoungePostSearchViewData({
    required this.query,
    required this.target,
    required this.items,
    required this.totalCount,
    required this.hasNext,
    required this.isFetchingMore,
  });

  final String query;
  final LoungePostSearchTarget target;
  final List<LoungePostSearchItem> items;
  final int totalCount;
  final bool hasNext;
  final bool isFetchingMore;

  LoungePostSearchViewData copyWith({
    String? query,
    LoungePostSearchTarget? target,
    List<LoungePostSearchItem>? items,
    int? totalCount,
    bool? hasNext,
    bool? isFetchingMore,
  }) {
    return LoungePostSearchViewData(
      query: query ?? this.query,
      target: target ?? this.target,
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      hasNext: hasNext ?? this.hasNext,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

/// ラウンジ内投稿検索（モック）用の Controller。
///
/// - 検索クエリでフィルタし、20件ずつ追加読み込みする
/// - 実APIに切り替える際も UI 側の呼び出しを変えずに済むようにする
class LoungePostSearchController extends AsyncNotifier<LoungePostSearchViewData> {
  static const int _pageSize = 20;

  // TODO(api): 実APIに差し替える（loungeId を含めて検索）
  List<LoungePostSearchItem> _items = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  String _query = '';
  LoungePostSearchTarget _target = LoungePostSearchTarget.title;
  int _totalCount = 0;
  bool _hasNext = false;

  @override
  Future<LoungePostSearchViewData> build() async {
    await _applyQuery('');
    return _current();
  }

  Future<void> setSearchTarget(LoungePostSearchTarget target) async {
    if (_target == target) return;
    _target = target;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _applyQuery(_query);
      return _current();
    });
  }

  Future<void> search(String query) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _applyQuery(query);
      return _current();
    });
  }

  Future<FetchMoreResult> fetchMore() async {
    if (_isFetchingMore) return FetchMoreResult.skipped;
    final cur = state.valueOrNull;
    if (cur == null) return FetchMoreResult.skipped;
    if (!cur.hasNext) return FetchMoreResult.noMore;

    _isFetchingMore = true;
    try {
      state = AsyncData(cur.copyWith(isFetchingMore: true));

      // TODO(api): 実APIならここで next page を取得する
      final result = await ref.read(searchLoungePostsUseCaseProvider).call(
            query: _query,
            target: _target,
            cursor: _cursor,
            limit: _pageSize,
          );
      final page = _requireSuccess(result);
      if (page.items.isEmpty) {
        state = AsyncData(cur.copyWith(hasNext: false, isFetchingMore: false));
        return FetchMoreResult.noMore;
      }

      _cursor += page.items.length;
      _items = [...cur.items, ...page.items];
      _totalCount = page.totalCount;
      _hasNext = page.hasNext;
      state = AsyncData(
        cur.copyWith(
          items: _items,
          totalCount: _totalCount,
          hasNext: _hasNext,
          isFetchingMore: false,
        ),
      );
      return FetchMoreResult.fetched;
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> _applyQuery(String query) async {
    _query = query.trim();
    if (_query.isEmpty) {
      _items = const [];
      _cursor = 0;
      _totalCount = 0;
      _hasNext = false;
      return;
    }
    _cursor = 0;
    final result = await ref.read(searchLoungePostsUseCaseProvider).call(
          query: _query,
          target: _target,
          cursor: _cursor,
          limit: _pageSize,
        );
    final page = _requireSuccess(result);
    _items = page.items;
    _cursor = page.items.length;
    _totalCount = page.totalCount;
    _hasNext = page.hasNext;
  }

  LoungePostSearchViewData _current() {
    return LoungePostSearchViewData(
      query: _query,
      target: _target,
      items: _items,
      totalCount: _totalCount,
      hasNext: _hasNext,
      isFetchingMore: false,
    );
  }
}

LoungePostSearchPage _requireSuccess(SearchLoungePostsResult result) {
  return result.when(
    success: (page) => page,
    networkError: () => throw Exception('network'),
    serverError: () => throw Exception('server'),
  );
}

