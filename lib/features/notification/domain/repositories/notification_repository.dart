import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';

/// 通知機能のリポジトリ。
///
/// - まずはモックで実装し、後から Dio/Retrofit を使った API 実装に差し替える。
abstract class NotificationRepository {
  /// 自分宛ての通知一覧を取得する。
  ///
  /// - 画面要件としては「未読のみ」を想定しているため、既定で未読のみ返す。
  Future<List<NotificationItem>> getNotifications({bool unreadOnly = true});

  /// 未読通知件数を取得する。
  Future<int> getUnreadCount();

  /// 通知を既読にする。
  Future<void> markAsRead(String notificationId);

  /// 通知設定を取得する。
  Future<NotificationSettings> getSettings();

  /// 通知設定を更新する。
  Future<void> updateSettings(NotificationSettings settings);
}


