import 'dart:async';

import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/core/utils/infinite_scroll_helper.dart';
import 'package:linky_project_0318/core/widgets/linky_divider.dart';
import 'package:linky_project_0318/core/widgets/linky_search_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_snack_bar.dart';
import 'package:linky_project_0318/core/widgets/paged_list.dart';

/// 検索ページの共通シェル（検索バー + 無限スクロール）。
class SearchPageShell<T> extends StatefulWidget {
  const SearchPageShell({
    super.key,
    required this.hintText,
    required this.items,
    required this.totalCount,
    required this.hasNext,
    required this.isFetchingMore,
    required this.onSearch,
    required this.onFetchMore,
    required this.itemBuilder,
    this.emptyMessage = '検索結果がありません。',
    this.noMoreMessage = '最後のページです。',
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    this.autofocus = true,
    this.debounceMs = 500,
    this.showNoMoreSnack = true,
  });

  final String hintText;
  final List<T> items;
  final int totalCount;
  final bool hasNext;
  final bool isFetchingMore;
  final Future<void> Function(String query) onSearch;
  final Future<FetchMoreResult> Function() onFetchMore;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String emptyMessage;
  final String noMoreMessage;
  final EdgeInsetsGeometry padding;
  final bool autofocus;
  final int debounceMs;
  final bool showNoMoreSnack;

  @override
  State<SearchPageShell<T>> createState() => _SearchPageShellState<T>();
}

class _SearchPageShellState<T> extends State<SearchPageShell<T>> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  Timer? _debounce;
  bool _noMoreSnackShown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: widget.debounceMs), () async {
      _noMoreSnackShown = false;
      await widget.onSearch(value);
    });
  }

  void _onClear() {
    _textController.clear();
    _noMoreSnackShown = false;
    widget.onSearch('');
    _focusNode.requestFocus();
  }

  void _onScroll() async {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (!InfiniteScrollHelper.hasScrollableExtent(pos)) return;

    if (InfiniteScrollHelper.shouldResetNoMoreSnack(
      pos: pos,
      snackShown: _noMoreSnackShown,
      showThresholdPx: 200,
      resetExtraPx: 100,
    )) {
      _noMoreSnackShown = false;
    }

    if (InfiniteScrollHelper.isNearBottom(pos, thresholdPx: 200)) {
      if (!widget.hasNext) return;
      final result = await widget.onFetchMore();
      if (result == FetchMoreResult.noMore &&
          widget.showNoMoreSnack &&
          !_noMoreSnackShown &&
          widget.noMoreMessage.isNotEmpty &&
          mounted) {
        _noMoreSnackShown = true;
        showLinkySnackBar(context, message: widget.noMoreMessage);
      }
    }
  }

  Widget _buildList(BuildContext context) {
    final showBottomLoader = widget.isFetchingMore;
    final itemCount = widget.items.length + (showBottomLoader ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const LinkyDivider(height: 1, thickness: 1),
      itemBuilder: (context, i) {
        if (showBottomLoader && i == itemCount - 1) {
          return const LinkyListBottomLoader();
        }
        final item = widget.items[i];
        return widget.itemBuilder(context, item);
      },
    );
  }

  Widget _buildDataBody(BuildContext context) {
    if (widget.totalCount == 0) {
      return LinkyListEmptyState(
        message: widget.emptyMessage,
        fontSize: 16,
      );
    }
    return _buildList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _textController,
            builder: (context, value, _) {
              final hasText = value.text.trim().isNotEmpty;
              return LinkySearchBar(
                hintText: widget.hintText,
                controller: _textController,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                onChanged: _onChanged,
                showClearButton: hasText,
                onPressedClear: _onClear,
              );
            },
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildDataBody(context)),
        ],
      ),
    );
  }
}

