import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/widgets/linky_bottom_nav_bar.dart';

/// ボトムナビゲーションを表示する「メインShell」。
///
/// - ラウンジ/ベスト（=タブ）は go() で切り替え（スタックを積まない）
/// - 検索/投稿作成 は push()（フローとして積む）
class MainShellScaffold extends StatelessWidget {
  const MainShellScaffold({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  // ボトムナビの “意味” を index に紐付ける（順番変更時の事故を防ぐ）
  static const int _idxHome = 0;
  static const int _idxLounge = 1;
  static const int _idxBest = 2;
  static const int _idxSearch = 3;
  static const int _idxCreate = 4;

  Uri? get _uri => Uri.tryParse(location);

  int? _tryParseLoungeIdFromLocation() {
    final path = _uri?.path ?? location;
    if (!path.startsWith('/lounge/')) return null;

    final segs = path.split('/').where((e) => e.isNotEmpty).toList();
    // /lounge/:id
    if (segs.length < 2) return null;
    return int.tryParse(segs[1]);
  }

  ///自分が選択したアイコンを表示するためのメソッド
  int _currentIndexFromLocation() {
    final path = _uri?.path ?? location;

    if (path.startsWith('/lounge/')) {
      final tab = LoungeTabX.fromQuery(_uri?.queryParameters['tab']);
      if (tab == LoungeTab.info) return _idxLounge;
      if (tab == LoungeTab.best) return _idxBest;
      return _idxHome;
    }
    return _idxHome;
  }

  void _onTapBottomNav(BuildContext context, int index) {
    final loungeId = _tryParseLoungeIdFromLocation();
    switch (index) {
      case _idxHome:
        if (loungeId != null) {
          // ラウンジ内なら「ラウンジHOME」タブへ戻す（ボトムナビ仕様）
          context.goLounge(loungeId, tab: LoungeTab.home);
        } else {
          context.goHome();
        }
        return;
      case _idxLounge:
        // ラウンジ内のみ有効（要件）
        if (loungeId == null) return;
        context.goLounge(loungeId, tab: LoungeTab.info);
        return;
      case _idxBest:
        // ラウンジ内のみ有効（要件）
        if (loungeId == null) return;
        context.goLounge(loungeId, tab: LoungeTab.best);
        return;
      case _idxSearch:
        context.pushLoungePostSearch();
        return;
      case _idxCreate:
        context.pushPostCreate();
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: LinkyBottomNavBar(
        show: true,
        currentIndex: _currentIndexFromLocation(),
        onTap: (i) => _onTapBottomNav(context, i),
      ),
    );
  }
}


