import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';
import 'package:linky_project_0318/features/lounge/presentation/widgets/lounge_card.dart';

class HomeLatestViewedPager extends StatefulWidget {
  const HomeLatestViewedPager({
    super.key,
    required this.items,
    required this.onFetchMore,
    required this.hasNext,
  });

  final List<LoungePreview> items;
  final VoidCallback onFetchMore;
  final bool hasNext;

  @override
  State<HomeLatestViewedPager> createState() => _HomeLatestViewedPagerState();
}

class _HomeLatestViewedPagerState extends State<HomeLatestViewedPager> {
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


