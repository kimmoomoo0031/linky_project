import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';

/// アプリ共通のボトムナビゲーション。
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGray,
            blurRadius: 8,
            offset: const Offset(0, -1),
          )
        ]
      ),
      child: NavigationBar(
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
      ),
    );
  }
}


