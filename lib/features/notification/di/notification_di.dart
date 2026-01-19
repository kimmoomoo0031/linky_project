import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/data/repositories/fake_notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_notification_settings_usecase.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_notifications_usecase.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_unread_count_usecase.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/mark_notification_read_usecase.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/update_notification_settings_usecase.dart';

/// Notification 機能の DI（依存関係のつなぎ込み）。
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeNotificationRepository();
});

final getNotificationsUseCaseProvider =
    Provider<GetNotificationsUseCase>((ref) {
  return GetNotificationsUseCase(ref.read(notificationRepositoryProvider));
});

final getUnreadCountUseCaseProvider = Provider<GetUnreadCountUseCase>((ref) {
  return GetUnreadCountUseCase(ref.read(notificationRepositoryProvider));
});

final markNotificationReadUseCaseProvider =
    Provider<MarkNotificationReadUseCase>((ref) {
  return MarkNotificationReadUseCase(ref.read(notificationRepositoryProvider));
});

final getNotificationSettingsUseCaseProvider =
    Provider<GetNotificationSettingsUseCase>((ref) {
  return GetNotificationSettingsUseCase(ref.read(notificationRepositoryProvider));
});

final updateNotificationSettingsUseCaseProvider =
    Provider<UpdateNotificationSettingsUseCase>((ref) {
  return UpdateNotificationSettingsUseCase(
    ref.read(notificationRepositoryProvider),
  );
});


