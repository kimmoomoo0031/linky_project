import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/di/notification_di.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';

/// 通知一覧（未読のみ）を扱うコントローラ。
class NotificationListController
    extends AutoDisposeAsyncNotifier<List<NotificationItem>> {
  @override
  Future<List<NotificationItem>> build() async {
    final repo = ref.read(notificationRepositoryProvider);
    return repo.getNotifications(unreadOnly: true);
  }

  /// 通知を既読にして、未読一覧から取り除く。
  Future<void> markAsReadAndRemove(String notificationId) async {
    final prev = state;
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(
        current.where((n) => n.id != notificationId).toList(),
      );
    }

    try {
      final repo = ref.read(notificationRepositoryProvider);
      await repo.markAsRead(notificationId);
    } catch (e, st) {
      // 失敗時は元に戻す（もしくは再取得）。
      state = prev;
      state = AsyncError(e, st);
    }
  }
}


