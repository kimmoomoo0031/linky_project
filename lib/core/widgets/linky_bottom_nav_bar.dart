import 'package:flutter/material.dart';

/// アプリ共通のボトムナビゲーション。
///
/// - 今は遷移未実装のため、[onTap] が null の場合は no-op にする
/// - 画面ごとに表示/非表示を切り替えるため [show] を用意する
class LinkyBottomNavBar extends StatelessWidget {
  const LinkyBottomNavBar({
    super.key,
    this.show = true,
    this.currentIndex = 0,
    this.onTap,
  });

  /// ボトムナビを表示するかどうか。
  final bool show;

  /// 現在選択中のタブ index。
  final int currentIndex;

  /// タブ選択時のハンドラ（未実装なら null でOK）。
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    final selected = currentIndex.clamp(0, 4);
    return NavigationBar(
      selectedIndex: selected,
      onDestinationSelected: (i) {
        if (i == selected) return;
        (onTap ?? (_) {})(i);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'ホーム',
        ),
        NavigationDestination(
          icon: Icon(Icons.meeting_room_outlined),
          selectedIcon: Icon(Icons.meeting_room),
          label: 'ラウンジ',
        ),
        NavigationDestination(
          icon: Icon(Icons.star_outline),
          selectedIcon: Icon(Icons.star),
          label: 'ベスト',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: '検索',
        ),
        NavigationDestination(
          icon: Icon(Icons.edit_outlined),
          selectedIcon: Icon(Icons.edit),
          label: '投稿',
        ),
      ],
    );
  }
}


