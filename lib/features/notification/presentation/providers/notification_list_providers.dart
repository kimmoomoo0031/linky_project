import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';
import 'package:linky_project_0318/features/notification/presentation/controllers/notification_list_controller.dart';

/// 通知一覧画面用の Provider（未読のみ）。
final notificationListControllerProvider = AsyncNotifierProvider.autoDispose<
    NotificationListController, List<NotificationItem>>(
  NotificationListController.new,
);


