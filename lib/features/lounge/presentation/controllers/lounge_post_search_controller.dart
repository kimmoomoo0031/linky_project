import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

/// ラウンジ内投稿検索画面向けの表示データ。
class LoungePostSearchViewData {
  const LoungePostSearchViewData({
    required this.query,
    required this.items,
    required this.totalCount,
    required this.hasNext,
    required this.isFetchingMore,
  });

  final String query;
  final List<MyPost> items;
  final int totalCount;
  final bool hasNext;
  final bool isFetchingMore;

  LoungePostSearchViewData copyWith({
    String? query,
    List<MyPost>? items,
    int? totalCount,
    bool? hasNext,
    bool? isFetchingMore,
  }) {
    return LoungePostSearchViewData(
      query: query ?? this.query,
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
  late final List<MyPost> _all = List.generate(100, (i) {
    return MyPost(
      id: i + 1,
      title: i == 0 ? '初めての投稿' : '投稿タイトル（モック） #${i + 1}',
      createdAt: DateTime.now().subtract(Duration(hours: i * 3)),
      nickname: i.isEven ? 'リンゴ' : 'ゲスト',
      viewCount: 2000 - i * 13,
      likeCount: 500 - i * 7,
      hasImage: i % 3 == 0,
      isGuest: i.isOdd,
    );
  });

  List<MyPost> _filtered = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  String _query = '';

  @override
  Future<LoungePostSearchViewData> build() async {
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
      state = AsyncData(cur.copyWith(isFetchingMore: true));

      // TODO(api): 実APIならここで next page を取得する
      await Future<void>.delayed(const Duration(milliseconds: 250));

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
      _filtered = const [];
      _cursor = 0;
      return;
    }

    final q = _query.toLowerCase();
    _filtered = _all
        .where(
          (e) => e.title.toLowerCase().contains(q) || e.nickname.toLowerCase().contains(q),
        )
        .toList();
    _cursor = 0;
    _nextSlice();
  }

  List<MyPost> _nextSlice() {
    final end = (_cursor + _pageSize).clamp(0, _filtered.length);
    final slice = _filtered.sublist(_cursor, end);
    _cursor = end;
    return slice;
  }

  LoungePostSearchViewData _current() {
    final shown = _filtered.sublist(0, _cursor.clamp(0, _filtered.length));
    return LoungePostSearchViewData(
      query: _query,
      items: shown,
      totalCount: _filtered.length,
      hasNext: _cursor < _filtered.length,
      isFetchingMore: false,
    );
  }
}

