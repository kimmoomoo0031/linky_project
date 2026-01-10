import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/core/enums/fetch_more_result.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/utils/infinite_scroll_helper.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/paged_list.dart';
import 'package:linky_project_0318/core/widgets/linky_snack_bar.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_main_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_main_providers.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_list_item.dart';

/// ラウンジメイン画面（モック）。
///
/// - AppBar にラウンジ名を表示
/// - 投稿一覧は最新順
/// - ボトムナビは Shell 側で制御する
class LoungeMainPage extends ConsumerStatefulWidget {
  const LoungeMainPage({
    super.key,
    required this.loungeId,
    required this.loungeTitle,
  });

  final int loungeId;
  final String loungeTitle;

  @override
  ConsumerState<LoungeMainPage> createState() => _LoungeMainPageState();
}

class _LoungeMainPageState extends ConsumerState<LoungeMainPage> {
  final _scrollController = ScrollController();
  bool _noMoreSnackShown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
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

    if (!InfiniteScrollHelper.isNearBottom(pos, thresholdPx: 200)) return;

    final result = await ref
        .read(loungeMainControllerProvider(widget.loungeId).notifier)
        .fetchMore();

    if (result == FetchMoreResult.noMore && mounted && !_noMoreSnackShown) {
      _noMoreSnackShown = true;
      showLinkySnackBar(context, message: '最後のページです。');
    }
  }

  Widget _buildList(LoungeMainViewData data) {
    final items = data.items;
    final showBottomLoader = data.isFetchingMore;
    final itemCount = items.length + (showBottomLoader ? 1 : 0);

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: itemCount,
      itemBuilder: (context, i) {
        if (showBottomLoader && i == itemCount - 1) {
          return const LinkyListBottomLoader();
        }

        final p = items[i];
        return PostListItem(
          post: p,
          showTopDivider: i == 0,
          showBottomDivider: true,
          onTap: () {
            // TODO: 投稿詳細へ（未実装）
          },
        );
      },
    );
  }

  Widget _buildDataBody(BuildContext context, LoungeMainViewData data) {
    if (data.items.isEmpty) {
      return const LinkyListEmptyState(message: 'まだ投稿がありません');
    }
    return _buildList(data);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final asyncData = ref.watch(loungeMainControllerProvider(widget.loungeId));

    return Scaffold(
      appBar: LinkyAppBar(
        title: widget.loungeTitle,
        showBackButton: true,
        onBackPressed: () {
          // ラウンジホームの戻る挙動:
          // - 通常は直前画面（ラウンジリスト等）へ戻す。
          // - タブ切替(go)後などでスタックが無い場合は /home にフォールバックする。
          if (context.canPop()) {
            context.pop();
            return;
          }
          context.goHome();
        },
      ),
      body: SafeArea(
        child: asyncData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(
              '投稿の取得に失敗しました。',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
          data: (data) => _buildDataBody(context, data),
        ),
      ),
    );
  }
}


