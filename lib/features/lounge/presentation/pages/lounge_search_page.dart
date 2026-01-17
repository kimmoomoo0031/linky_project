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
    final data = async.valueOrNull;
    final isLoading = async.isLoading && data == null;
    Widget? errorBody;

    if (async.hasError) {
      final traceId = TraceId.newId();
      AppLog.err(
        feature: 'LOUNGE',
        action: 'SEARCH',
        traceId: traceId,
        ms: 0,
        error: async.error!,
        stackTrace: async.stackTrace ?? StackTrace.empty,
      );
      final msg = AppError.from(async.error!).userMessage(
        context: AppErrorContext.loungeSearch,
      );
      errorBody = Center(
        child: Text(
          msg,
          style: AppTextStyles.body14.copyWith(color: cs.error),
        ),
      );
    }

    return Scaffold(
      appBar: const LinkyAppBar(title: 'ラウンジ検索', showBackButton: true),
      body: SafeArea(
        child: SearchPageShell<LoungeSearchItem>(
          hintText: 'ラウンジ検索',
          items: data?.items ?? const [],
          totalCount: data?.totalCount ?? 0,
          hasNext: data?.hasNext ?? false,
          isFetchingMore: data?.isFetchingMore ?? false,
          onSearch: controller.search,
          onFetchMore: controller.fetchMore,
          isLoading: isLoading,
          errorBody: errorBody,
          itemBuilder: (context, item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
        ),
      ),
    );
  }
}


