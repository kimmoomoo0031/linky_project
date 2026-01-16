import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/utils/infinite_scroll_helper.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_divider.dart';
import 'package:linky_project_0318/core/widgets/linky_search_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_snack_bar.dart';
import 'package:linky_project_0318/core/widgets/paged_list.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_search_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_search_controller.dart';

/// ラウンジ検索画面。
///
/// - 入力はデバウンスして検索（モック）
/// - 検索結果は無限スクロールで20件ずつ追加表示
/// - 追加取得ができない場合は SnackBar を表示
class LoungeSearchPage extends ConsumerStatefulWidget {
  const LoungeSearchPage({super.key});

  @override
  ConsumerState<LoungeSearchPage> createState() => _LoungeSearchPageState();
}

class _LoungeSearchPageState extends ConsumerState<LoungeSearchPage> {
  static const _debounceMs = 500;

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
    _debounce = Timer(const Duration(milliseconds: _debounceMs), () async {
      _noMoreSnackShown = false;
      await ref.read(loungeSearchControllerProvider.notifier).search(value);
    });
  }

  void _onClear() {
    _textController.clear();
    _noMoreSnackShown = false;
    ref.read(loungeSearchControllerProvider.notifier).search('');
    _focusNode.requestFocus();
  }

  void _onScroll() async {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (!InfiniteScrollHelper.hasScrollableExtent(pos)) return;

    // UX: 「最後のページです」スナックバーは、底付近から少し離れたら再度表示できるようにリセットする。
    if (InfiniteScrollHelper.shouldResetNoMoreSnack(
      pos: pos,
      snackShown: _noMoreSnackShown,
      showThresholdPx: 200,
      resetExtraPx: 100, // 100px 離れたらリセット
    )) {
      _noMoreSnackShown = false;
    }

    // 末尾付近で追加取得
    if (InfiniteScrollHelper.isNearBottom(pos, thresholdPx: 200)) {
      final result =
          await ref.read(loungeSearchControllerProvider.notifier).fetchMore();
      if (result == FetchMoreResult.noMore && mounted && !_noMoreSnackShown) {
        _noMoreSnackShown = true;
        showLinkySnackBar(context, message: '最後のページです。');
      }
    }
  }

  Widget _buildList(BuildContext context, LoungeSearchViewData data) {
    final cs = Theme.of(context).colorScheme;
    final showBottomLoader = data.isFetchingMore;
    final itemCount = data.items.length + (showBottomLoader ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const LinkyDivider(height: 1, thickness: 1),
      itemBuilder: (context, i) {
        if (showBottomLoader && i == itemCount - 1) {
          return const LinkyListBottomLoader();
        }

        final item = data.items[i];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: AppTextStyles.body12.copyWith(
                    color: cs.onSurface,
                  ),
                ),
              ),
              Text(
                '全投稿数：${item.totalPostCount}',
                style: AppTextStyles.body12.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataBody(BuildContext context, LoungeSearchViewData data) {
    if (data.totalCount == 0) {
      return const LinkyListEmptyState(
        message: '検索結果がありません。',
        fontSize: 16,
      );
    }
    return _buildList(context, data);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final async = ref.watch(loungeSearchControllerProvider);

    return Scaffold(
      appBar: const LinkyAppBar(title: 'ラウンジ検索', showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _textController,
                builder: (context, value, _) {
                  final hasText = value.text.trim().isNotEmpty;
                  return LinkySearchBar(
                    hintText: 'ラウンジ検索',
                    controller: _textController,
                    focusNode: _focusNode,
                    autofocus: true,
                    onChanged: _onChanged,
                    showClearButton: hasText,
                    onPressedClear: _onClear,
                  );
                },
              ),
              const SizedBox(height: 12),
              Expanded(
                child: async.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) {
                    final traceId = TraceId.newId();
                    AppLog.err(
                      feature: 'LOUNGE',
                      action: 'SEARCH',
                      traceId: traceId,
                      ms: 0,
                      error: e,
                      stackTrace: st,
                    );
                    final msg = AppError.from(e).userMessage(
                      context: AppErrorContext.loungeSearch,
                    );
                    return Center(
                      child: Text(
                        msg,
                        style: AppTextStyles.body14.copyWith(color: cs.error),
                      ),
                    );
                  },
                  data: (data) {
                    return _buildDataBody(context, data);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


