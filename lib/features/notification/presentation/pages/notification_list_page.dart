import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/trace_id.dart';
import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/notification/presentation/providers/notification_list_providers.dart';
import 'package:linky_project_0318/features/notification/presentation/widgets/notification_list_tile.dart';
import 'package:linky_project_0318/features/notification/presentation/providers/notification_snack_event_providers.dart';
import 'package:linky_project_0318/core/widgets/feedback/snack_bar.dart';

import '../../../../core/theme/app_colors.dart';

/// 通知一覧画面（未読のみ）。
class NotificationListPage extends ConsumerWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final asyncList = ref.watch(notificationListControllerProvider);
    ref.listen(notificationSnackEventProvider, (previous, next) {
      if (next == null) return;
      showLinkySnackBar(context, message: next);
      ref.read(notificationSnackEventProvider.notifier).state = null;
    });

    return Scaffold(
      appBar: LinkyAppBar(
        title: '通知一覧',
        showBackButton: true,
        showClearNotificationButton: true,
        onClearNotificationPressed: () async {
          final ok = await showLinkyConfirmDialog(
            context: context,
            title: '未読の通知を既読にしますか？',
            message: '未読の通知がすべて既読になります。',
            confirmText: '既読する',
            type: LinkyDialogType.confirm,
            isDestructive: false,
          );
          if (!ok) return;

          // TODO: ここで「全通知を既読化」処理を呼ぶ
          // ref.read(notificationListControllerProvider.notifier).markAllAsRead();
        },
      ),
      body: SafeArea(
        child: asyncList.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) {
            final traceId = TraceId.newId();
            AppLog.err(
              feature: 'NOTIFICATION',
              action: 'LIST',
              traceId: traceId,
              ms: 0,
              error: e,
              stackTrace: st,
            );
            final msg = AppError.from(e).userMessage(
              context: AppErrorContext.notifications,
            );
            return Center(
              child: Text(
                msg,
                style: AppTextStyles.body14.copyWith(color: cs.error),
              ),
            );
          },
          data: (items) {
            if (items.isEmpty) {
              return Center(
                child: Text(
                  '新しい通知はありません',
                  style:
                      AppTextStyles.body18.copyWith(color: AppColors.primaryGray),
                ),
              );
            }

            return ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const LinkyDivider(),
              itemBuilder: (context, i) {
                final item = items[i];
                return NotificationListTile(
                  item: item,
                  onTap: () => ref
                      .read(notificationListControllerProvider.notifier)
                      .markAsReadAndRemove(item.id),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


