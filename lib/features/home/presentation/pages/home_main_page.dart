import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/core/widgets/linky_search_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_snack_bar.dart';
import 'package:linky_project_0318/features/home/home_exports.dart';
import 'package:linky_project_0318/features/home/domain/entities/lounge_preview.dart';
import 'package:linky_project_0318/features/home/presentation/pages/home_menu_page.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_best_posts_list.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_latest_viewed_pager.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_main_app_bar.dart';
import 'package:linky_project_0318/features/home/presentation/widgets/home_section_title.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/core/enums/linky_dialog_type.dart';

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
        error: (e, st) {
          final traceId = TraceId.newId();
          AppLog.err(
            feature: 'HOME',
            action: 'MAIN',
            traceId: traceId,
            ms: 0,
            error: e,
            stackTrace: st,
          );
          final msg = AppError.from(e).userMessage(context: AppErrorContext.home);
          return Center(
            child: Text(
              msg,
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          );
        },
        data: (data) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinkySearchBar(
                  hintText: 'ラウンジ検索',
                  readOnly: true,
                  onTap: () => context.pushLoungeSearch()
                ),
                const SizedBox(height: 16),
                const HomeSectionTitle('最新閲覧'),
                const SizedBox(height: 16),
                _HomeLatestViewedSection(
                  items: data.latestViewed,
                  hasNext: data.latestHasNext,
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

class _HomeLatestViewedSection extends ConsumerWidget {
  const _HomeLatestViewedSection({
    required this.items,
    required this.hasNext,
  });

  final List<LoungePreview> items;
  final bool hasNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeLatestViewedPager(
      items: items,
      onFetchMore: () =>
          ref.read(homeControllerProvider.notifier).fetchMoreLatest(),
      hasNext: hasNext,
      onTapItem: (lounge) {
        context.pushLounge(
          lounge.id,
          loungeTitle: lounge.title,
        );
      },
      onLongPressItem: (lounge) async {
        final ok = await showLinkyConfirmDialog(
          context: context,
          message: '最近閲覧から削除しますか？',
          confirmText: '削除',
          type: LinkyDialogType.confirm,
          isDestructive: true,
          barrierDismissible: true,
        );
        if (!ok) return;

        try {
          await ref
              .read(homeControllerProvider.notifier)
              .removeLatestViewed(loungeId: lounge.id);
        } catch (_) {
          if (!context.mounted) return;
          showLinkySnackBar(
            context,
            message: CommonMessages.errors.deleteFailed.message,
          );
        }
      },
    );
  }
}
