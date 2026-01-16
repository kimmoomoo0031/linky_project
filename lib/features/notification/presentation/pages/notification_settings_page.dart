import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_divider.dart';
import 'package:linky_project_0318/features/notification/notification_exports.dart';

/// 通知設定画面（モック）。
class NotificationSettingsPage extends ConsumerWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final asyncSettings = ref.watch(notificationSettingsControllerProvider);

    return Scaffold(
      appBar: const LinkyAppBar(title: '通知設定', showBackButton: true),
      body: asyncSettings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) {
          final traceId = TraceId.newId();
          AppLog.err(
            feature: 'NOTIFICATION',
            action: 'SETTINGS',
            traceId: traceId,
            ms: 0,
            error: e,
            stackTrace: st,
          );
          final msg = AppError.from(e).userMessage(
            context: AppErrorContext.notificationSettings,
          );
          return Center(
            child: Text(
              msg,
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          );
        },
        data: (settings) {
          return ListView(
            children: [
              _SettingRow(
                title: 'コメント',
                subtitle: '投稿にコメントが付いたときに通知します',
                value: settings.commentEnabled,
                onChanged: (v) => ref
                    .read(notificationSettingsControllerProvider.notifier)
                    .setCommentEnabled(v),
              ),
              const LinkyDivider(),
              _SettingRow(
                title: 'ラウンジ申請',
                subtitle: 'ラウンジ申請の結果（承認/却下など）を通知します',
                value: settings.loungeRequestEnabled,
                onChanged: (v) => ref
                    .read(notificationSettingsControllerProvider.notifier)
                    .setLoungeRequestEnabled(v),
              ),
              const LinkyDivider(),
            ],
          );
        },
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body14.copyWith(color: cs.onSurface),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: AppTextStyles.body10.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}


