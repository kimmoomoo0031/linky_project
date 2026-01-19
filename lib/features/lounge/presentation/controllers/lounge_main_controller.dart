import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/utils/paged_fetch_helper.dart';
import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_posts_result.dart';
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
class LoungeMainController
    extends FamilyAsyncNotifier<LoungeMainViewData, int> {
  /// [Lounge/Main] 1ページあたりの取得件数。
  static const int _pageSize = 20;

  final PagedFetchHelper<MyPost, LoungePostPage> _pager =
      PagedFetchHelper<MyPost, LoungePostPage>(pageSize: _pageSize);
  int _loungeId = 0;

  @override
  Future<LoungeMainViewData> build(int loungeId) async {
    _loungeId = loungeId;
    _pager.reset();
    final result = await ref
        .read(getLoungePostsUseCaseProvider)
        .call(loungeId: loungeId, cursor: _pager.cursor, limit: _pageSize);
    final page = _requireSuccess(result);
    _pager.setCursor(page.items.length);
    return LoungeMainViewData(
      items: page.items,
      hasNext: page.hasNext,
      isFetchingMore: false,
    );
  }

  Future<FetchMoreResult> fetchMore() async {
    final cur = state.valueOrNull;
    return _pager.fetchMore<LoungeMainViewData>(
      currentValue: cur,
      hasNext: cur?.hasNext ?? false,
      currentItems: cur?.items ?? const [],
      loadPage: (cursor, limit) async {
        final result = await ref
            .read(getLoungePostsUseCaseProvider)
            .call(loungeId: _loungeId, cursor: cursor, limit: limit);
        return _requireSuccess(result);
      },
      getItems: (page) => page.items,
      getHasNext: (page) => page.hasNext,
      setValue: (value) => state = AsyncData(value),
      buildView:
          (
            current, {
            required items,
            required hasNext,
            required isFetchingMore,
          }) => current.copyWith(
            items: items,
            hasNext: hasNext,
            isFetchingMore: isFetchingMore,
          ),
    );
  }
}

LoungePostPage _requireSuccess(GetLoungePostsResult result) {
  return result.when(
    success: (page) => page,
    networkError: () => throw const AppErrorNetwork(),
    serverError: () => throw const AppErrorServer(),
  );
}
