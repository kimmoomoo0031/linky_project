import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  ///自分が選択したアイコンを表示するためのメソッド
  int _currentIndexFromLocation() {
    // ラウンジ詳細中は「ホーム選択中」に見せる（要件）
    if (location.startsWith('/lounge/')) return _idxHome;
    if (location.startsWith('/tabs/lounge')) return _idxLounge;
    if (location.startsWith('/tabs/best')) return _idxBest;
    return _idxHome;
  }

  void _onTapBottomNav(BuildContext context, int index) {
    switch (index) {
      case _idxHome:
        context.go('/home');
        return;
      case _idxLounge:
        // タブは go() で切替（履歴を積まない）
        if (!location.startsWith('/tabs/lounge')) {
          context.go('/tabs/lounge');
        }
        return;
      case _idxBest:
        // タブは go() で切替（履歴を積まない）
        if (!location.startsWith('/tabs/best')) {
          context.go('/tabs/best');
        }
        return;
      case _idxSearch:
        context.push('/loungePostSearch');
        return;
      case _idxCreate:
        context.push('/post/create');
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


