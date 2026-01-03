import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_search_bar.dart';
import 'package:linky_project_0318/features/home/home_exports.dart';
import 'package:linky_project_0318/features/home/presentation/pages/home_menu_page.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_best_posts_list.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_latest_viewed_pager.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_main_app_bar.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_section_title.dart';

/// ホーム画面（メイン側）。
class HomeMainPage extends ConsumerStatefulWidget {
  const HomeMainPage({super.key});

  @override
  ConsumerState<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends ConsumerState<HomeMainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() => _scaffoldKey.currentState?.openEndDrawer();

  void _closeDrawer() {
    final state = _scaffoldKey.currentState;
    if (state == null) return;

    if (state.isEndDrawerOpen) {
      Navigator.of(context).pop();
      return;
    }
  }

  void _navigate(String path, {bool replace = false}) {
    // Drawer を閉じた後でも遷移に使う context が生きているように、
    // “メイン側”の context で遷移を実行する。
    _closeDrawer();
    Future.microtask(() {
      if (!mounted) return;
      if (replace) {
        context.go(path);
      } else {
        context.push(path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawerWidthSize = MediaQuery.sizeOf(context).width * 0.9;
    final asyncHome = ref.watch(homeControllerProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        width: drawerWidthSize,
        child: HomeMenuPage(onClose: _closeDrawer, onNavigate: _navigate),
      ),
      appBar: HomeMainAppBar(onPressedMenu: _openDrawer),
      body: asyncHome.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            'error: $e',
            style: AppTextStyles.body14.copyWith(color: cs.error),
          ),
        ),
        data: (data) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinkySearchBar(
                  hintText: 'ラウンジ検索',
                  readOnly: true,
                  onTap: () => context.push('/loungeSearch'),
                ),
                const SizedBox(height: 16),
                const HomeSectionTitle('最新閲覧'),
                const SizedBox(height: 16),
                HomeLatestViewedPager(
                  items: data.latestViewed,
                  onFetchMore: () => ref
                      .read(homeControllerProvider.notifier)
                      .fetchMoreLatest(),
                  hasNext: data.latestHasNext,
                  onTapItem: (lounge) {
                    context.push('/lounge/${lounge.id}', extra: lounge.title);
                  },
                ),
                const SizedBox(height: 16),
                const HomeSectionTitle('ベスト投稿'),
                const SizedBox(height: 16),
                HomeBestPostsList(items: data.bestPosts),
              ],
            ),
          );
        },
      ),
    );
  }
}
