import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';

/// 通知機能のリポジトリ。
///
/// - まずはモックで実装し、後から Dio/Retrofit を使った API 実装に差し替える。
abstract class NotificationRepository {
  /// 通知設定を取得する。
  Future<NotificationSettings> getSettings();

  /// 通知設定を更新する。
  Future<void> updateSettings(NotificationSettings settings);
}


