import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_best_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_info_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_best_providers.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_list_item.dart';

/// ベストタブ（ベスト投稿一覧）。
class LoungeBestPage extends ConsumerStatefulWidget {
  const LoungeBestPage({super.key, required this.loungeId});

  final int loungeId;

  @override
  ConsumerState<LoungeBestPage> createState() => _LoungeBestPageState();
}

class _LoungeBestPageState extends ConsumerState<LoungeBestPage> {
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
    final hasNext =
        ref.read(loungeBestControllerProvider(widget.loungeId)).valueOrNull?.hasNext ??
            true;
    _noMoreSnackShown = await handleFetchMoreWithNoMoreSnack(
      context: context,
      position: pos,
      noMoreSnackShown: _noMoreSnackShown,
      hasNext: hasNext,
      fetchMore: ref
          .read(loungeBestControllerProvider(widget.loungeId).notifier)
          .fetchMore,
    );
  }

  Widget _buildList(LoungeBestViewData data) {
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

  Widget _buildDataBody(BuildContext context, LoungeBestViewData data) {
    if (data.items.isEmpty) {
      return const LinkyListEmptyState(message: 'ベスト投稿がありません');
    }
    return _buildList(data);
  }

  @override
  Widget build(BuildContext context) {
    final loungeTitle =
        ref.watch(loungeInfoControllerProvider(widget.loungeId)).valueOrNull?.title;
    final cs = Theme.of(context).colorScheme;
    final asyncData = ref.watch(loungeBestControllerProvider(widget.loungeId));

    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ベスト投稿',
        showBackButton: true,
        onBackPressed: () {
          context.goLounge(
            widget.loungeId,
            tab: LoungeTab.home,
            loungeTitle: loungeTitle,
          );
        },
      ),
      body: SafeArea(
        child: asyncData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(
              'ベスト投稿の取得に失敗しました。',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
          data: (data) => _buildDataBody(context, data),
        ),
      ),
    );
  }
}


