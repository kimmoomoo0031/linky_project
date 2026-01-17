import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/search_page_shell.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_search_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_search_controller.dart';

/// ラウンジ検索画面。
///
/// - 入力はデバウンスして検索（モック）
/// - 検索結果は無限スクロールで20件ずつ追加表示
/// - 追加取得ができない場合は SnackBar を表示
class LoungeSearchPage extends ConsumerWidget {
  const LoungeSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final async = ref.watch(loungeSearchControllerProvider);
    final controller = ref.read(loungeSearchControllerProvider.notifier);

    return Scaffold(
      appBar: const LinkyAppBar(title: 'ラウンジ検索', showBackButton: true),
      body: SafeArea(
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
            return SearchPageShell<LoungeSearchItem>(
              hintText: 'ラウンジ検索',
              items: data.items,
              totalCount: data.totalCount,
              hasNext: data.hasNext,
              isFetchingMore: data.isFetchingMore,
              onSearch: controller.search,
              onFetchMore: controller.fetchMore,
              itemBuilder: (context, item) {
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
          },
        ),
      ),
    );
  }
}


