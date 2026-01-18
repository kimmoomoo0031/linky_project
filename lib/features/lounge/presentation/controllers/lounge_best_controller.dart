import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_best_posts_result.dart';
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

  int _cursor = 0;
  bool _isFetchingMore = false;
  int _loungeId = 0;

  @override
  Future<LoungeBestViewData> build(int loungeId) async {
    _loungeId = loungeId;
    _cursor = 0;
    final result = await ref.read(getLoungeBestPostsUseCaseProvider).call(
          loungeId: loungeId,
          cursor: _cursor,
          limit: _pageSize,
        );
    final page = _requireSuccess(result);
    _cursor += page.items.length;

    return LoungeBestViewData(
      items: page.items,
      hasNext: page.hasNext,
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

      final result = await ref.read(getLoungeBestPostsUseCaseProvider).call(
            loungeId: _loungeId,
            cursor: _cursor,
            limit: _pageSize,
          );
      final page = _requireSuccess(result);
      if (page.items.isEmpty) {
        state = AsyncData(cur.copyWith(hasNext: false, isFetchingMore: false));
        return FetchMoreResult.noMore;
      }
      _cursor += page.items.length;
      final merged = [...cur.items, ...page.items];

      state = AsyncData(
        cur.copyWith(
          items: merged,
          hasNext: page.hasNext,
          isFetchingMore: false,
        ),
      );
      return FetchMoreResult.fetched;
    } finally {
      _isFetchingMore = false;
    }
  }
}

LoungePostPage _requireSuccess(GetLoungeBestPostsResult result) {
  return result.when(
    success: (page) => page,
    networkError: () => throw Exception('network'),
    serverError: () => throw Exception('server'),
  );
}


