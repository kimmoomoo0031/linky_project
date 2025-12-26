import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeNotificationRepository implements NotificationRepository {
  NotificationSettings _settings = const NotificationSettings(
    commentEnabled: true,
    loungeRequestEnabled: false,
  );

  @override
  Future<NotificationSettings> getSettings() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _settings;
  }

  @override
  Future<void> updateSettings(NotificationSettings settings) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _settings = settings;
  }
}


