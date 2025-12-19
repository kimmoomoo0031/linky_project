import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/theme/theme_mode_provider.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/home/home_providers.dart';
import 'package:linky_project_0318/features/home/presentation/menu/home_menu_item.dart';

typedef HomeMenuNavigate = void Function(String path, {bool replace});

/// ホームのメニュー画面（Drawer内表示用）。
class HomeMenuPage extends ConsumerWidget {
  const HomeMenuPage({
    super.key,
    required this.onClose,
    required this.onNavigate,
  });

  final VoidCallback onClose;
  final HomeMenuNavigate onNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHome = ref.watch(homeControllerProvider);
    final me = asyncHome.valueOrNull?.me;
    final cs = Theme.of(context).colorScheme;
    final mode = ref.watch(themeModeProvider);
    final isDark = mode == ThemeMode.dark;
    final logoutState = ref.watch(authSessionControllerProvider);

    final items = <HomeMenuItem>[
      HomeMenuItem.myPosts,
      HomeMenuItem.profileEdit,
      HomeMenuItem.notificationSettings,
      HomeMenuItem.loungeRequest,
      HomeMenuItem.logout,
      HomeMenuItem.withdraw,
    ];

    final handler = _HomeMenuActionHandler(
      ref: ref,
      onClose: onClose,
      onNavigate: onNavigate,
      logoutState: logoutState,
    );

    // Drawer内/外に関わらず、ListTile が要求する Material 祖先をここで保証する。
    return Material(
      color: cs.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _HomeMenuHeader(
                isDark: isDark,
                onToggleTheme: () =>
                    ref.read(themeModeProvider.notifier).toggle(),
                onClose: onClose,
              ),
              const SizedBox(height: 8),
              _UserHeader(
                nickname: me?.nickname ?? '—',
                email: me?.email ?? '',
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _HomeMenuList(
                  items: items,
                  titleColorFor: (item) => item.titleColor(cs),
                  onTapItem: handler.handle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMenuHeader extends StatelessWidget {
  const _HomeMenuHeader({
    required this.isDark,
    required this.onToggleTheme,
    required this.onClose,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        const SizedBox(width: 8),
        SvgPicture.asset(AppAssets.linkyLogoSvg, width: 20, height: 20),
        const SizedBox(width: 6),
        const Spacer(),
        IconButton(
          onPressed: onToggleTheme,
          icon: SvgPicture.asset(
            isDark ? AppAssets.lightModeLogoSvg : AppAssets.darkModeLogoSvg,
            width: 25,
            height: 25,
          ),
        ),
        IconButton(
          onPressed: onClose,
          icon: Icon(Icons.close, color: cs.onSurfaceVariant),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}

class _HomeMenuList extends StatelessWidget {
  const _HomeMenuList({
    required this.items,
    required this.titleColorFor,
    required this.onTapItem,
  });

  final List<HomeMenuItem> items;
  final Color? Function(HomeMenuItem item) titleColorFor;
  final Future<void> Function(HomeMenuItem item) onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _MenuTile(
          title: item.title(),
          titleColor: titleColorFor(item),
          onTap: () => onTapItem(item),
        );
      },
    );
  }
}

class _HomeMenuActionHandler {
  _HomeMenuActionHandler({
    required this.ref,
    required this.onClose,
    required this.onNavigate,
    required this.logoutState,
  });

  final WidgetRef ref;
  final VoidCallback onClose;
  final HomeMenuNavigate onNavigate;
  final AsyncValue<void> logoutState;

  Future<void> handle(HomeMenuItem item) async {
    switch (item) {
      case HomeMenuItem.myPosts:
        onNavigate('/myPosts');
        return;
      case HomeMenuItem.profileEdit:
        onNavigate('/profileEdit');
        return;
      case HomeMenuItem.notificationSettings:
      case HomeMenuItem.loungeRequest:
      case HomeMenuItem.withdraw:
        // 未実装（見た目は通常にする）
        return;
      case HomeMenuItem.logout:
        if (logoutState.isLoading) return; // 連打抑止
        onClose();
        final repo = ref.read(authRepositoryProvider);
        await ref.read(authSessionControllerProvider.notifier).logout(repo);
        onNavigate('/login', replace: true);
        return;
    }
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
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.title,
    required this.onTap,
    this.titleColor,
  });

  final String title;
  final VoidCallback onTap;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textColor = titleColor ?? cs.onSurfaceVariant;
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


