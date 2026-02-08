import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/enums/notification_type.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeNotificationRepository implements NotificationRepository {
  NotificationSettings _settings = const NotificationSettings(
    commentEnabled: true,
    loungeRequestEnabled: false,
  );

  final List<NotificationItem> _notifications = <NotificationItem>[
    NotificationItem(
      id: 'n_1',
      type: NotificationType.postComment,
      actorName: '山田さん',
      targetPostId: 'post_12',
      createdAt: DateTime(2025, 10, 11, 9, 41),
    ),
    NotificationItem(
      id: 'n_2',
      type: NotificationType.postComment,
      actorName: '山田さん',
      targetPostId: 'post_99',
      createdAt: DateTime(2025, 10, 11, 17, 35),
    ),
    NotificationItem(
      id: 'n_3',
      type: NotificationType.bestPost,
      targetPostId: 'post_77',
      postTitle: '日本生活の楽しみ',
      createdAt: DateTime(2025, 10, 11, 17, 35),
    ),
    NotificationItem(
      id: 'n_4',
      type: NotificationType.commentReply,
      actorName: '山田さん',
      targetPostId: 'post_12',
      targetCommentId: 'comment_55',
      targetReplyId: 'reply_102',
      createdAt: DateTime(2025, 10, 11, 17, 35),
    ),
  ];

  @override
  Future<List<NotificationItem>> getNotifications({bool unreadOnly = true}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final items = unreadOnly
        ? _notifications.where((n) => !n.isRead).toList()
        : List<NotificationItem>.of(_notifications);

    // 最新順（上が最新）
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  @override
  Future<int> getUnreadCount() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return _notifications.where((n) => !n.isRead).length;
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final idx = _notifications.indexWhere((n) => n.id == notificationId);
    if (idx == -1) return;
    _notifications[idx] = _notifications[idx].copyWith(readAt: DateTime.now());
  }

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


