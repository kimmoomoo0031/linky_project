import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_search_item.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounges_result.dart';

/// ラウンジ検索画面向けの表示データ。
class LoungeSearchViewData {
  const LoungeSearchViewData({
    required this.query,
    required this.items,
    required this.totalCount,
    required this.hasNext,
    required this.isFetchingMore,
  });

  final String query;
  final List<LoungeSearchItem> items;
  final int totalCount;
  final bool hasNext;
  final bool isFetchingMore;

  LoungeSearchViewData copyWith({
    String? query,
    List<LoungeSearchItem>? items,
    int? totalCount,
    bool? hasNext,
    bool? isFetchingMore,
  }) {
    return LoungeSearchViewData(
      query: query ?? this.query,
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      hasNext: hasNext ?? this.hasNext,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

/// ラウンジ検索（モック）用の Controller。
///
/// - 検索クエリでフィルタし、20件ずつ追加読み込みする
/// - 実APIに切り替える際も UI 側の呼び出しを変えずに済むようにする
class LoungeSearchController extends AsyncNotifier<LoungeSearchViewData> {
  static const int _pageSize = 20;

  List<LoungeSearchItem> _items = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  String _query = '';
  int _totalCount = 0;
  bool _hasNext = false;

  @override
  Future<LoungeSearchViewData> build() async {
    await _applyQuery('');
    return _current();
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
      // UI 側で下部インジケータを出すため、先にフラグだけ立てて反映する
      state = AsyncData(cur.copyWith(isFetchingMore: true));

      final result = await ref.read(searchLoungesUseCaseProvider).call(
            query: _query,
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
      // UX: 初期状態（検索語なし）は一覧表示せず、空表示にする
      _items = const [];
      _cursor = 0;
      _totalCount = 0;
      _hasNext = false;
      return;
    }

    _cursor = 0;
    final result = await ref.read(searchLoungesUseCaseProvider).call(
          query: _query,
          cursor: _cursor,
          limit: _pageSize,
        );
    final page = _requireSuccess(result);
    _items = page.items;
    _cursor = page.items.length;
    _totalCount = page.totalCount;
    _hasNext = page.hasNext;
  }

  LoungeSearchViewData _current() {
    return LoungeSearchViewData(
      query: _query,
      items: _items,
      totalCount: _totalCount,
      hasNext: _hasNext,
      isFetchingMore: false,
    );
  }
}

LoungeSearchPage _requireSuccess(SearchLoungesResult result) {
  return result.when(
    success: (page) => page,
    networkError: () => throw Exception('network'),
    serverError: () => throw Exception('server'),
  );
}


