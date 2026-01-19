import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/enums/lounge_post_search_target.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_post_search_item.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_post_search_providers.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_list_item.dart';

/// ラウンジ内投稿検索ページ（モック）。
class LoungePostSearchPage extends ConsumerWidget {
  const LoungePostSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final async = ref.watch(loungePostSearchControllerProvider);
    final controller = ref.read(loungePostSearchControllerProvider.notifier);
    final data = async.valueOrNull;
    final isLoading = async.isLoading && data == null;
    Widget? errorBody;

    if (async.hasError) {
      final traceId = TraceId.newId();
      AppLog.err(
        feature: 'LOUNGE',
        action: 'POST_SEARCH',
        traceId: traceId,
        ms: 0,
        error: async.error!,
        stackTrace: async.stackTrace ?? StackTrace.empty,
      );
      final msg = AppError.from(
        async.error!,
      ).userMessage(context: AppErrorContext.loungeSearch);
      errorBody = Center(
        child: Text(msg, style: AppTextStyles.body14.copyWith(color: cs.error)),
      );
    }

    return Scaffold(
      appBar: const LinkyAppBar(title: '投稿検索', showBackButton: true),
      body: SafeArea(
        child: SearchPageShell<LoungePostSearchItem>(
          hintText: '',
          items: data?.items ?? const [],
          totalCount: data?.totalCount ?? 0,
          hasNext: data?.hasNext ?? false,
          isFetchingMore: data?.isFetchingMore ?? false,
          onSearch: controller.search,
          onFetchMore: controller.fetchMore,
          isLoading: isLoading,
          errorBody: errorBody,
          showSearchFilterIcon: true,
          onTapSearchFilter: () async {
            final selected =
                await showLinkySelectionBottomSheet<LoungePostSearchTarget>(
              context: context,
              title: '検索対象',
              selectedValue: data?.target ?? LoungePostSearchTarget.title,
              items: const [
                LinkySelectionItem(
                  value: LoungePostSearchTarget.title,
                  label: 'タイトル',
                ),
                LinkySelectionItem(
                  value: LoungePostSearchTarget.content,
                  label: '内容',
                ),
                LinkySelectionItem(
                  value: LoungePostSearchTarget.author,
                  label: '投稿者',
                ),
              ],
            );
            if (selected == null) return;
            await controller.setSearchTarget(selected);
          },
          itemBuilder: (context, item) {
            return PostListItem(post: item.toMyPost(), onTap: () {});
          },
        ),
      ),
    );
  }
}
