import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/home_menu_item.dart';

import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/presentation/providers/auth_session_providers.dart';

/// 設定画面（ホームメニューから遷移）。
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final logoutState = ref.watch(authSessionControllerProvider);
    final handler = _SettingsActionHandler(ref: ref, logoutState: logoutState);

    return Scaffold(
      appBar: const LinkyAppBar(title: '設定', showBackButton: true),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            _SectionTitle(title: '通知'),
            const LinkyDivider(height: 20),
            _SettingTile(
              title: SettingsItem.notificationSettings.title(),
              titleColor: SettingsItem.notificationSettings.titleColor(cs),
              onTap: () => handler.handle(context, SettingsItem.notificationSettings),
            ),
            const SizedBox(height: 20),
            _SectionTitle(title: 'アカウント'),
            const LinkyDivider(height: 20),
            _SettingTile(
              title: SettingsItem.logout.title(),
              titleColor: SettingsItem.logout.titleColor(cs),
              onTap: () => handler.handle(context, SettingsItem.logout),
            ),
            const SizedBox(height: 10),
            _SettingTile(
              title: SettingsItem.withdraw.title(),
              titleColor: SettingsItem.withdraw.titleColor(cs),
              onTap: () => handler.handle(context, SettingsItem.withdraw),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: AppTextStyles.body18.copyWith(color: cs.onSurfaceVariant),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.title,
    required this.onTap,
    this.titleColor,
  });

  final String title;
  final VoidCallback? onTap;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textColor = titleColor ?? cs.onSurface;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body14.copyWith(color: textColor),
                  ),
                ),
                Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
              ],
            ),
          ),
        ),
        const LinkyDivider(height: 1,),
      ],
    );
  }
}

class _SettingsActionHandler {
  _SettingsActionHandler({
    required this.ref,
    required this.logoutState,
  });

  final WidgetRef ref;
  final AsyncValue<void> logoutState;

  Future<void> handle(BuildContext context, SettingsItem item) async {
    switch (item) {
      case SettingsItem.notificationSettings:
        context.pushNotificationSettings();
        return;
      case SettingsItem.withdraw:
        context.pushWithdraw();
        return;
      case SettingsItem.logout:
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

        await ref.read(authSessionControllerProvider.notifier).logout();
        if (!context.mounted) return;
        context.goLogin();
        return;
    }
  }
}


