import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import 'package:linky_project_0318/features/home/home_providers.dart';
import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';
import 'package:linky_project_0318/features/lounge/presentation/widgets/lounge_card.dart';
import 'package:linky_project_0318/features/home/presentation/pages/home_menu_page.dart';

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
    final asyncHome = ref.watch(homeControllerProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: HomeMenuPage(
          onClose: _closeDrawer,
          onNavigate: _navigate,
        ),
      ),
      appBar: _MainAppBar(onPressedMenu: _openDrawer),
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
                const _SearchBarStub(),
                const SizedBox(height: 16),
                _SectionTitle('最新閲覧'),
                const SizedBox(height: 16),
                _LatestViewedPager(
                  items: data.latestViewed,
                  onFetchMore: () => ref
                      .read(homeControllerProvider.notifier)
                      .fetchMoreLatest(),
                  hasNext: data.latestHasNext,
                ),
                const SizedBox(height: 16),
                _SectionTitle('ベスト投稿'),
                const SizedBox(height: 16),
                _BestPostsList(items: data.bestPosts),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar({required this.onPressedMenu});

  final VoidCallback onPressedMenu;

  @override
  // このウィジェットが望むサイズ（特に高さ）を Scaffold に伝えるための値。
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // TODO: 通知画面
          },
          icon: SvgPicture.asset(AppAssets.bellLogoSvg, width: 25, height: 25),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.linkyLogoSvg, width: 40, height: 40),
          ],
        ),
        actions: [
          IconButton(
            onPressed: onPressedMenu,
            icon: SvgPicture.asset(
              AppAssets.mainScreenListLogoSvg,
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBarStub extends StatelessWidget {
  const _SearchBarStub();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {

        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                'ラウンジ検索',
                style: AppTextStyles.body12.copyWith(
                  color: cs.outlineVariant,
                ),
              ),
            ),
            Icon(Icons.search, color: cs.outlineVariant),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientText(
        text,
        gradient: AppColors.linky45degGradient,
        style: AppTextStyles.body14,
      ),
    );
  }
}

class _LatestViewedPager extends StatefulWidget {
  const _LatestViewedPager({
    required this.items,
    required this.onFetchMore,
    required this.hasNext,
  });

  final List<LoungePreview> items;
  final VoidCallback onFetchMore;
  final bool hasNext;

  @override
  State<_LatestViewedPager> createState() => _LatestViewedPagerState();
}

class _LatestViewedPagerState extends State<_LatestViewedPager> {
  final PageController _controller = PageController();
  int _page = 0;
  static const int _itemsPerPage = 8; // 3列×2行

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    final pageCount = (items.length / _itemsPerPage).ceil().clamp(1, 9999);
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              const crossAxisCount = 4;
              const mainAxisSpacing = 12.0;
              const crossAxisSpacing = 12.0;
              // PageViewのページ境界でカード枠線が“ピタッと接触”して見えるのを防ぐため、
              // 各ページの中身に左右インセットを入れて必ず“隙間”を作る。
              const pageHorizontalInset = 6.0;
              const rowsPerPage = 2;
              // タイル全体 = 正方形サムネ + タイトル領域 なので、少し縦長に確保する
              const childAspectRatio = 0.68;

              final effectiveWidth =
                  (constraints.maxWidth - pageHorizontalInset * 2)
                      .clamp(0.0, constraints.maxWidth);
              final tileWidth =
                  (effectiveWidth -
                      crossAxisSpacing * (crossAxisCount - 1)) /
                  crossAxisCount;
              final tileHeight = tileWidth / childAspectRatio;
              final gridHeight =
                  rowsPerPage * tileHeight +
                  mainAxisSpacing * (rowsPerPage - 1);

              return SizedBox(
                height: gridHeight,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pageCount,
                  onPageChanged: (p) {
                    setState(() => _page = p);
                    // UX: 最後のページに来てから待たせないため、直前（最後-1）で先読みする。
                    // ただしページ数が少ない場合（1〜2ページ）は最終ページで先読みする。
                    final prefetchIndex = pageCount >= 3
                        ? pageCount - 2
                        : pageCount - 1;
                    if (widget.hasNext && p >= prefetchIndex) {
                      widget.onFetchMore();
                    }
                  },
                  itemBuilder: (context, pageIndex) {
                    final start = pageIndex * _itemsPerPage;
                    final end = (start + _itemsPerPage).clamp(0, items.length);
                    final slice = items.sublist(start, end);

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: pageHorizontalInset,
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              mainAxisSpacing: mainAxisSpacing,
                              crossAxisSpacing: crossAxisSpacing,
                              childAspectRatio: childAspectRatio,
                            ),
                        itemCount: _itemsPerPage,
                        itemBuilder: (context, i) {
                          if (i >= slice.length) {
                            return const SizedBox.shrink();
                          }

                          final item = slice[i];
                          final title = item.title;

                          return LoungeCard(
                            title: title,
                            // ユーザーが画像未登録(null)なら LoungeCard 側がデフォルト画像へフォールバックする
                            // （将来はここにS3 URLが入る想定）
                            thumbnailUrl: item.thumbnailUrl,
                            fallbackThumbnail: SvgPicture.asset(
                              AppAssets.linkyLogoSvg,
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          _DotsIndicator(count: pageCount, index: _page),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == index;
        return Container(
          width: active ? 10 : 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: active ? cs.primary : cs.outlineVariant,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}

class _BestPostsList extends StatelessWidget {
  const _BestPostsList({required this.items});

  final List<BestPost> items;

  @override
  Widget build(BuildContext context) {
    final list = items;
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(list.length, (i) {
          final item = list[i];
          final title = item.title;
          final date = item.dateLabel;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '${i + 1}.',
                    style: AppTextStyles.body12.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body12.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.body12.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
