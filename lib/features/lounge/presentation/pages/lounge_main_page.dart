import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_bottom_nav_bar.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_main_controller.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_list_item.dart';

/// ラウンジメイン画面（モック）。
///
/// - AppBar にラウンジ名を表示
/// - 投稿一覧は最新順
/// - ボトムナビは共通ウィジェットを使用（遷移はまだ未実装でOK）
class LoungeMainPage extends ConsumerWidget {
  const LoungeMainPage({
    super.key,
    required this.loungeId,
    required this.loungeTitle,
    this.showBottomNav = true,
  });

  final int loungeId;
  final String loungeTitle;
  final bool showBottomNav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final asyncPosts = ref.watch(loungeMainControllerProvider(loungeId));

    return Scaffold(
      appBar: LinkyAppBar(
        title: loungeTitle,
        showBackButton: true,
      ),
      bottomNavigationBar: LinkyBottomNavBar(
        show: showBottomNav,
        currentIndex: 1,
        // NOTE: ルーティングはまだ未実装のため no-op
        onTap: null,
      ),
      body: SafeArea(
        child: asyncPosts.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(
              '投稿の取得に失敗しました。',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
          data: (posts) {
            if (posts.isEmpty) {
              return Center(
                child: Text(
                  '投稿がありません',
                  style: AppTextStyles.body14.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: posts.length,
              itemBuilder: (context, i) {
                final p = posts[i];
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
          },
        ),
      ),
    );
  }
}


