import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/presentation/controllers/notification_settings_controller.dart';

/// 通知設定画面用の Provider。
final notificationSettingsControllerProvider = AsyncNotifierProvider.autoDispose<
    NotificationSettingsController, NotificationSettings>(
  NotificationSettingsController.new,
);


