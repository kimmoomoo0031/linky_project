import 'package:linky_project_0318/core/enums/notification_type.dart';

/// 通知一覧で利用する通知エンティティ。
///
/// - 未読のみを表示し、タップで既読化（一覧から除去）する前提。

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.type,
    required this.createdAt,
    this.actorName,
    this.targetPostId,
    this.targetCommentId,
    this.targetReplyId,
    this.postTitle,
    this.readAt,
  });

  final String id;
  final NotificationType type;
  final DateTime createdAt;

  /// コメント/返信をしたユーザー名。
  final String? actorName;

  /// 遷移先の投稿ID（今は未実装だが、将来の遷移のため保持）。
  final String? targetPostId;

  /// 返信対象のコメントID（返信通知の場合に利用）。
  final String? targetCommentId;

  /// 返信のID（返信通知の場合に利用）。
  final String? targetReplyId;

  /// ベスト投稿通知で表示する投稿タイトル。
  final String? postTitle;

  /// 既読日時（null の場合は未読）。
  final DateTime? readAt;

  bool get isRead => readAt != null;

  NotificationItem copyWith({
    DateTime? readAt,
  }) {
    return NotificationItem(
      id: id,
      type: type,
      createdAt: createdAt,
      actorName: actorName,
      targetPostId: targetPostId,
      targetCommentId: targetCommentId,
      targetReplyId: targetReplyId,
      postTitle: postTitle,
      readAt: readAt ?? this.readAt,
    );
  }
}


