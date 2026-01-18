import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/core/theme/theme_mode_provider.dart';
import 'package:linky_project_0318/core/export/auth_exports.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/guest_gate_page.dart';
import 'package:linky_project_0318/core/export/home_exports.dart';
import 'package:linky_project_0318/features/home/presentation/pages/logged_in_menu_view.dart';

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
    final isGuest = me?.isGuest ?? false;

    final items = <HomeMenuItem>[
      HomeMenuItem.myPosts,
      HomeMenuItem.profileEdit,
      HomeMenuItem.notificationSettings,
      HomeMenuItem.createLounge,
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
        child: Column(
          children: [
            const SizedBox(height: 12),
            _HomeMenuHeader(
              isDark: isDark,
              onToggleTheme: () =>
                  ref.read(themeModeProvider.notifier).toggle(),
              onClose: onClose,
            ),
            const LinkyDivider(),
            Expanded(
              child: Padding(
                // ヘッダーは独立させ、本文側のみ全体パディングを適用する
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Expanded(
                      child: isGuest
                          ? GuestGateView(
                              onLogin: () {
                                onClose();
                                onNavigate('/login', replace: true);
                              },
                            )
                          : LoggedInMenuView(
                              me: me,
                              items: items,
                              titleColorFor: (item) => item.titleColor(cs),
                              onTapItem: (item) => handler.handle(context, item),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        SvgPicture.asset(AppAssets.linkyLogoSvg, width: 30, height: 30),
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
      ],
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

  Future<void> handle(BuildContext context, HomeMenuItem item) async {
    switch (item) {
      case HomeMenuItem.myPosts:
        onNavigate('/myPosts');
        return;
      case HomeMenuItem.profileEdit:
        onNavigate('/profileEdit');
        return;
      case HomeMenuItem.notificationSettings:
        onNavigate('/notificationSettings');
        return;
      case HomeMenuItem.createLounge:
        onNavigate('/loungeCreate');
        return;
      case HomeMenuItem.withdraw:
        onClose();
        onNavigate('/withdraw');
        return;
      case HomeMenuItem.logout:
        if (logoutState.isLoading) return; // 連打抑止
        final ok = await showLinkyConfirmDialog(
          context: context,
          title: 'ログアウト確認',
          message: 'ログアウトしますか？',
          confirmText: 'ログアウト',
          type: LinkyDialogType.confirm,
          isDestructive: true,
        );
        if (!ok) return;

        onClose();
        await ref.read(authSessionControllerProvider.notifier).logout();
        onNavigate('/login', replace: true);
        return;
    }
  }
}

