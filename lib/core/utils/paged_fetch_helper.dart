import 'package:linky_project_0318/core/enums/fetch_more_result.dart';

/// ページング取得の共通フローだけを提供するヘルパー。
///
/// - 検索条件や画面固有の状態は各 Controller 側で管理する
/// - fetchMore の重複コードのみを共通化する
class PagedFetchHelper<T, P> {
  PagedFetchHelper({required int pageSize}) : _pageSize = pageSize;

  final int _pageSize;
  int _cursor = 0;
  bool _isFetchingMore = false;

  int get cursor => _cursor;
  int get pageSize => _pageSize;

  void reset() {
    _cursor = 0;
    _isFetchingMore = false;
  }

  void setCursor(int value) {
    _cursor = value;
  }

  Future<FetchMoreResult> fetchMore<V>({
    required V? currentValue,
    required bool hasNext,
    required List<T> currentItems,
    required Future<P> Function(int cursor, int limit) loadPage,
    required List<T> Function(P page) getItems,
    required bool Function(P page) getHasNext,
    required void Function(V value) setValue,
    required V Function(
      V current, {
      required List<T> items,
      required bool hasNext,
      required bool isFetchingMore,
    }) buildView,
    void Function(P page)? onPage,
  }) async {
    if (_isFetchingMore) return FetchMoreResult.skipped;
    if (currentValue == null) return FetchMoreResult.skipped;
    if (!hasNext) return FetchMoreResult.noMore;

    _isFetchingMore = true;
    try {
      setValue(
        buildView(
          currentValue,
          items: currentItems,
          hasNext: hasNext,
          isFetchingMore: true,
        ),
      );

      final page = await loadPage(_cursor, _pageSize);
      final items = getItems(page);
      if (items.isEmpty) {
        setValue(
          buildView(
            currentValue,
            items: currentItems,
            hasNext: false,
            isFetchingMore: false,
          ),
        );
        return FetchMoreResult.noMore;
      }

      _cursor += items.length;
      onPage?.call(page);
      final merged = [...currentItems, ...items];
      final nextHasNext = getHasNext(page);
      setValue(
        buildView(
          currentValue,
          items: merged,
          hasNext: nextHasNext,
          isFetchingMore: false,
        ),
      );
      return FetchMoreResult.fetched;
    } finally {
      _isFetchingMore = false;
    }
  }
}

