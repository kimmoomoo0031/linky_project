import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/features/post/post_providers_exports.dart';

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
          error: (e, st) => Center(
            child: Text(
              'error: $e',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
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

            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: posts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final p = posts[i];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: cs.surface,
                    border: Border.all(color: cs.outlineVariant),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.title,
                          style: AppTextStyles.body14
                              .copyWith(color: cs.onSurfaceVariant),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        p.dateLabel,
                        style: AppTextStyles.body12
                            .copyWith(color: cs.onSurfaceVariant),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
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


