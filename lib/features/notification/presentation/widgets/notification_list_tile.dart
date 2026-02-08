import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';
import 'package:linky_project_0318/features/notification/enums/notification_type.dart';

/// 通知一覧の1行表示。
class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final NotificationItem item;
  final VoidCallback onTap;

  static String _formatRightTime(DateTime dt) {
    final now = DateTime.now();
    final isToday =
        now.year == dt.year && now.month == dt.month && now.day == dt.day;

    if (isToday) {
      final hh = dt.hour.toString().padLeft(2, '0');
      final mm = dt.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y/$m/$d';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _Message(item: item)),
            const SizedBox(width: 12),
            Text(
              _formatRightTime(item.createdAt),
              style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.item});

  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    switch (item.type) {
      case NotificationType.postComment:
        return Text(
          '${item.actorName ?? ''}がコメントを投稿しました',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body14.copyWith(color: cs.onSurface),
        );

      case NotificationType.commentReply:
        return Text(
          '${item.actorName ?? ''}があなたのコメントに返信しました',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body14.copyWith(color: cs.onSurface),
        );

      case NotificationType.bestPost:
        final title = item.postTitle ?? '';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'あなたの投稿「$title」が',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body14.copyWith(color: cs.onSurface),
            ),
            Text(
              'ベスト投稿になりました！',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body14.copyWith(color: cs.onSurface),
            ),
          ],
        );
    }
  }
}


