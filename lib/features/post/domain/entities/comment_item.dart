import 'package:flutter/foundation.dart';

/// 投稿コメント（大コメント/返信（1段）共通）。
@immutable
class CommentItem {
  const CommentItem({
    required this.id,
    required this.postId,
    required this.authorNickname,
    required this.authorIsGuest,
    required this.createdAt,
    required this.content,
    required this.parentCommentId,
    required this.isDeleted,
    required this.deletedAt,
    required this.canDelete,
  });

  final String id;
  final String postId;

  final String authorNickname;
  final bool authorIsGuest;

  final DateTime createdAt;
  final String content;

  /// null: 大コメント / not null: 返信（親コメントID）
  final String? parentCommentId;

  /// 論理削除フラグ。
  final bool isDeleted;

  /// 削除時刻（論理削除時のみ）。
  final DateTime? deletedAt;

  /// UI表示用: 自分のコメントなら削除できる（自己コメントのみ削除）。
  final bool canDelete;

  CommentItem copyWith({
    String? content,
    bool? isDeleted,
    DateTime? deletedAt,
    bool? canDelete,
  }) {
    return CommentItem(
      id: id,
      postId: postId,
      authorNickname: authorNickname,
      authorIsGuest: authorIsGuest,
      createdAt: createdAt,
      content: content ?? this.content,
      parentCommentId: parentCommentId,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      canDelete: canDelete ?? this.canDelete,
    );
  }
}


