import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/constants/lounge_constants.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

/// ベストタブ向けの表示データ（投稿一覧 + ページング状態）。
class LoungeBestViewData {
  const LoungeBestViewData({
    required this.items,
    required this.hasNext,
    required this.isFetchingMore,
  });

  final List<MyPost> items;
  final bool hasNext;
  final bool isFetchingMore;

  LoungeBestViewData copyWith({
    List<MyPost>? items,
    bool? hasNext,
    bool? isFetchingMore,
  }) {
    return LoungeBestViewData(
      items: items ?? this.items,
      hasNext: hasNext ?? this.hasNext,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

/// ラウンジベスト（投稿一覧）を取得するコントローラ（モック）。
///
/// - 画面は「データ取得中心」なので AsyncNotifier を採用
/// - 初回20件 + スクロールで20件ずつ追加取得
class LoungeBestController extends FamilyAsyncNotifier<LoungeBestViewData, int> {
  /// [Lounge/Best] 1ページあたりの取得件数。
  static const int _pageSize = 20;

  late List<MyPost> _all = const [];
  int _cursor = 0;
  bool _isFetchingMore = false;
  int _loungeId = 0;

  @override
  Future<LoungeBestViewData> build(int loungeId) async {
    _loungeId = loungeId;
    final now = DateTime.now();

    final baseLike = LoungeConstants.popularStarMinLikeCount + 40;
    final baseView = (loungeId.abs() % 11) * 50;

    _all = List<MyPost>.generate(100, (i) {
      final created = now.subtract(Duration(minutes: i * 13));
      return MyPost(
        id: _loungeId * 100000 + i,
        title: 'テストタイトルですテストタイトルです',
        createdAt: created,
        nickname: i.isEven ? 'パインアップル' : 'リンゴ',
        viewCount: baseView + i * 10,
        likeCount: baseLike + (i % 5) * 10,
        hasImage: i % 3 == 1,
        isGuest: i % 4 == 0,
      );
    });

    _cursor = 0;
    final first = _nextSlice();

    return LoungeBestViewData(
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


