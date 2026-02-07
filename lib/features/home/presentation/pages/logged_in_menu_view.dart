import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/home/domain/entities/home_user.dart';
import 'package:linky_project_0318/core/export/home_exports.dart';

/// ログイン済みユーザー向け：メニュー本体（Drawer内）。
class LoggedInMenuView extends StatelessWidget {
  const LoggedInMenuView({
    super.key,
    required this.me,
    required this.items,
    required this.onTapItem,
  });

  final HomeUser? me;
  final List<HomeMenuItem> items;
  final Future<void> Function(HomeMenuItem item) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _UserHeader(
          nickname: me?.nickname ?? '—',
          email: me?.email ?? '',
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _HomeMenuList(
            items: items,
            onTapItem: onTapItem,
          ),
        ),
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({required this.nickname, required this.email});

  final String nickname;
  final String email;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            nickname,
            style: AppTextStyles.body16Bold.copyWith(color: cs.onSurface),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _HomeMenuList extends StatelessWidget {
  const _HomeMenuList({
    required this.items,
    required this.onTapItem,
  });

  final List<HomeMenuItem> items;
  final Future<void> Function(HomeMenuItem item) onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _MenuTile(
          title: item.title(),
          onTap: () => onTapItem(item),
        );
      },
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textColor = cs.onSurfaceVariant;
    final chevronColor = cs.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: cs.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: cs.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body14.copyWith(color: textColor),
                  ),
                ),
                Icon(Icons.chevron_right, color: chevronColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


