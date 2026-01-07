import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

/// ラウンジメイン画面向けの表示データ（投稿一覧 + ページング状態）。
class LoungeMainViewData {
  const LoungeMainViewData({
    required this.items,
    required this.hasNext,
    required this.isFetchingMore,
  });

  final List<MyPost> items;
  final bool hasNext;
  final bool isFetchingMore;

  LoungeMainViewData copyWith({
    List<MyPost>? items,
    bool? hasNext,
    bool? isFetchingMore,
  }) {
    return LoungeMainViewData(
      items: items ?? this.items,
      hasNext: hasNext ?? this.hasNext,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

/// ラウンジメイン（投稿一覧）を取得するコントローラ（モック）。
///
/// - 画面は「データ取得中心」なので AsyncNotifier を採用
/// - createdAt 降順（最新順）で表示する
/// - 初回20件 + スクロールで20件ずつ追加取得
class LoungeMainController extends FamilyAsyncNotifier<LoungeMainViewData, int> {
  static const int _pageSize = 20;

  late List<MyPost> _all = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  int _loungeId = 0;

  @override
  Future<LoungeMainViewData> build(int loungeId) async {
    // TODO: 実API接続後は Repository 経由で取得する
    _loungeId = loungeId;
    final now = DateTime.now();

    // モック：ラウンジIDに応じて見た目が少し変わるように seed を入れる
    final baseLike = (loungeId.abs() % 7) * 20;
    final baseView = (loungeId.abs() % 11) * 50;

    // モック全体プール（最新→過去の順）
    _all = List<MyPost>.generate(100, (i) {
      final created = now.subtract(Duration(minutes: i * 13));
      return MyPost(
        id: _loungeId * 100000 + i,
        title: 'テストタイトルですテストタイトルです',
        createdAt: created,
        nickname: i.isEven ? 'パインアップル' : 'リンゴ',
        viewCount: baseView + i * 10,
        likeCount: baseLike + (i % 5) * 50,
        hasImage: i % 3 == 1,
        isGuest: false,
      );
    });

    _cursor = 0;
    final first = _nextSlice();
    return LoungeMainViewData(
      items: first,
      hasNext: _cursor < _all.length,
      isFetchingMore: false,
    );
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

      if (_cursor >= _all.length) {
        state = AsyncData(cur.copyWith(hasNext: false, isFetchingMore: false));
        return FetchMoreResult.noMore;
      }

      final next = _nextSlice();
      final merged = [...cur.items, ...next];
      state = AsyncData(
        cur.copyWith(
          items: merged,
          hasNext: _cursor < _all.length,
          isFetchingMore: false,
        ),
      );
      return FetchMoreResult.fetched;
    } finally {
      _isFetchingMore = false;
    }
  }

  List<MyPost> _nextSlice() {
    final end = (_cursor + _pageSize).clamp(0, _all.length);
    final slice = _all.sublist(_cursor, end);
    _cursor = end;
    return slice;
  }
}

