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

  int? _tryParseLoungeIdFromLocation() {
    // location は query を含む可能性があるので path を抜き出す
    final path = Uri.tryParse(location)?.path ?? location;
    if (!path.startsWith('/lounge/')) return null;

    final segs = path.split('/').where((e) => e.isNotEmpty).toList();
    // /lounge/:id
    if (segs.length < 2) return null;
    return int.tryParse(segs[1]);
  }

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
          final loungeId = _tryParseLoungeIdFromLocation();
          // 想定: このタブはラウンジ詳細画面（/lounge/:id）からのみ表示される。
          // loungeId が取れない場合は何もしない（不正な遷移を防ぐ）。
          if (loungeId == null) return;
          context.go('/tabs/lounge?loungeId=$loungeId');
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


