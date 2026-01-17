import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/search_page_shell.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_post_search_controller.dart';
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

    return Scaffold(
      appBar: const LinkyAppBar(title: '投稿検索', showBackButton: true),
      body: SafeArea(
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) {
            final traceId = TraceId.newId();
            AppLog.err(
              feature: 'LOUNGE',
              action: 'POST_SEARCH',
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
            return SearchPageShell(
              hintText: '投稿検索',
              items: data.items,
              totalCount: data.totalCount,
              hasNext: data.hasNext,
              isFetchingMore: data.isFetchingMore,
              onSearch: controller.search,
              onFetchMore: controller.fetchMore,
              itemBuilder: (context, item) {
                return PostListItem(
                  post: item,
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}


