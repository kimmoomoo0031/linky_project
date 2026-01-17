import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
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
    this.isLoading = false,
    this.errorBody,
    this.showSearchFilterIcon = false,
    this.onTapSearchFilter,
    this.emptyMessage = '検索結果がありません。',
    this.noMoreMessage = '最後のページです。',
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
  final bool isLoading;
  final Widget? errorBody;
  final bool showSearchFilterIcon;
  final VoidCallback? onTapSearchFilter;
  final String emptyMessage;
  final String noMoreMessage;
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
    _noMoreSnackShown = await handleFetchMoreWithNoMoreSnack(
      context: context,
      position: pos,
      noMoreSnackShown: _noMoreSnackShown,
      hasNext: widget.hasNext,
      fetchMore: widget.onFetchMore,
      showNoMoreSnack: widget.showNoMoreSnack,
      noMoreMessage: widget.noMoreMessage,
    );
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
    if (widget.errorBody != null) {
      return widget.errorBody!;
    }
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
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
    final cs = Theme.of(context).colorScheme;
    final iconColor = cs.outlineVariant;
    final showFilter = widget.showSearchFilterIcon;
    final prefixIcon = showFilter
        ? SvgPicture.asset(
            AppAssets.searchListLogoSvg,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          )
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _textController,
          builder: (context, value, _) {
            final hasText = value.text.trim().isNotEmpty;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: LinkySearchBar(
                hintText: widget.hintText,
                controller: _textController,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                onChanged: _onChanged,
                prefixIcon: prefixIcon,
                onPressedPrefix: showFilter ? widget.onTapSearchFilter : null,
                showClearButton: hasText,
                onPressedClear: _onClear,
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        const LinkyDivider(),
        Expanded(child: _buildDataBody(context)),
      ],
    );
  }
}

