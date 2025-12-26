import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/data/repositories/fake_notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';

/// Notification 機能の DI（依存関係のつなぎ込み）。
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeNotificationRepository();
});


