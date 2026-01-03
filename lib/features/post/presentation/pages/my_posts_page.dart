import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error.dart';
import 'package:linky_project_0318/core/error/app_error_context.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/features/post/post_exports.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_list_item.dart';

/// 自分の投稿一覧（モック）。
class MyPostsPage extends ConsumerWidget {
  const MyPostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(myPostsControllerProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const LinkyAppBar(title: '自分の投稿', showBackButton: true),
      body: SafeArea(
        child: asyncPosts.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) {
            final traceId = TraceId.newId();
            AppLog.err(
              feature: 'POST',
              action: 'MY_POSTS',
              traceId: traceId,
              ms: 0,
              error: e,
              stackTrace: st,
            );
            final msg = AppError.from(e).userMessage(
              contextLabel: AppErrorContext.myPosts,
            );
            return Center(
              child: Text(
                msg,
                style: AppTextStyles.body14.copyWith(color: cs.error),
              ),
            );
          },
          data: (posts) {
            if (posts.isEmpty) {
              return Center(
                child: Text(
                  '投稿がありません',
                  style:
                      AppTextStyles.body14.copyWith(color: cs.onSurfaceVariant),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: posts.length,
              itemBuilder: (context, i) {
                final p = posts[i];
                return PostListItem(
                  post: p,
                  showTopDivider: i == 0,
                  showBottomDivider: true,
                  onTap: () {
                    // TODO: 投稿詳細へ
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}


