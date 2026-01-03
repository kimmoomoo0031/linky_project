import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';

/// ラウンジ検索の1行分の表示モデル（モック）。
class LoungeSearchItem {
  const LoungeSearchItem({
    required this.name,
    required this.totalPostCount,
  });

  final String name;
  final int totalPostCount;
}

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

  // TODO(api): 実APIに差し替える
  late final List<LoungeSearchItem> _all = List.generate(100, (i) {
    return LoungeSearchItem(
      name: i == 0 ? '日本生活' : 'ラウンジ（モック） #${i + 1}',
      totalPostCount: 10000 - i * 37,
    );
  });

  List<LoungeSearchItem> _filtered = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  String _query = '';

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

      // TODO(api): 実APIならここで next page を取得する
      await Future<void>.delayed(const Duration(milliseconds: 250));

      // 末尾まで到達している場合でも、一度“取得中”を見せてから noMore を返す
      if (_cursor >= _filtered.length) {
        state = AsyncData(cur.copyWith(hasNext: false, isFetchingMore: false));
        return FetchMoreResult.noMore;
      }

      final next = _nextSlice();
      final merged = [...cur.items, ...next];
      state = AsyncData(
        cur.copyWith(
          items: merged,
          hasNext: _cursor < _filtered.length,
          isFetchingMore: false,
        ),
      );
      return FetchMoreResult.fetched;
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> _applyQuery(String query) async {
    // TODO(api): 実APIならここで検索APIを呼ぶ
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _query = query.trim();
    if (_query.isEmpty) {
      // UX: 初期状態（検索語なし）は一覧表示せず、空表示にする
      _filtered = const [];
      _cursor = 0;
      return;
    }

    _filtered = _all
        .where((e) => e.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    _cursor = 0;
    _nextSlice(); // 初回20件を確定
  }

  List<LoungeSearchItem> _nextSlice() {
    final end = (_cursor + _pageSize).clamp(0, _filtered.length);
    final slice = _filtered.sublist(_cursor, end);
    _cursor = end;
    return slice;
  }

  LoungeSearchViewData _current() {
    final shown = _filtered.sublist(0, _cursor.clamp(0, _filtered.length));
    return LoungeSearchViewData(
      query: _query,
      items: shown,
      totalCount: _filtered.length,
      hasNext: _cursor < _filtered.length,
      isFetchingMore: false,
    );
  }
}


