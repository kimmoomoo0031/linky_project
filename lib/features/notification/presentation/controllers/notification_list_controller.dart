import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/di/notification_di.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/features/notification/presentation/providers/notification_snack_event_providers.dart';

/// 通知一覧（未読のみ）を扱うコントローラ。
class NotificationListController
    extends AutoDisposeAsyncNotifier<List<NotificationItem>> {
  void _emitSnack(String message) {
    ref.read(notificationSnackEventProvider.notifier).state = message;
  }

  @override
  Future<List<NotificationItem>> build() async {
    final result =
        await ref.read(getNotificationsUseCaseProvider).call(unreadOnly: true);
    return result.when(
      success: (items) => items,
      networkError: () => throw const AppErrorNetwork(),
      serverError: () => throw const AppErrorServer(),
    );
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
      final result =
          await ref.read(markNotificationReadUseCaseProvider).call(
                notificationId,
              );
      result.when(
        success: () {},
        networkError: () {
          state = prev;
          _emitSnack(CommonMessages.errors.network.message);
        },
        serverError: () {
          state = prev;
          _emitSnack(CommonMessages.errors.server.message);
        },
      );
    } catch (_) {
      state = prev;
      _emitSnack(CommonMessages.errors.unexpected.message);
    }
  }
}


