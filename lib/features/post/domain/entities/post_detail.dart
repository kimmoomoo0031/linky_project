import 'package:linky_project_0318/features/post/enums/reaction_type.dart';

class PostDetail {
  const PostDetail({
    required this.id,
    required this.title,
    required this.contentPlain,
    required this.authorNickname,
    required this.authorIsGuest,
    required this.createdAt,
    required this.viewCount,
    required this.commentCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.myReaction,
  });

  final String id;
  final String title;

  /// MVP: まずはプレーンテキストで表示（HTMLレンダリングは後続）。
  final String contentPlain;

  final String authorNickname;
  final bool authorIsGuest;

  final DateTime createdAt;
  final int viewCount;
  final int commentCount;

  final int likeCount;
  final int dislikeCount;

  /// 現在ユーザーの投票状態（1回投票したら固定）。
  final ReactionType myReaction;

  PostDetail copyWith({
    int? commentCount,
    int? likeCount,
    int? dislikeCount,
    ReactionType? myReaction,
  }) {
    return PostDetail(
      id: id,
      title: title,
      contentPlain: contentPlain,
      authorNickname: authorNickname,
      authorIsGuest: authorIsGuest,
      createdAt: createdAt,
      viewCount: viewCount,
      commentCount: commentCount ?? this.commentCount,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      myReaction: myReaction ?? this.myReaction,
    );
  }
}


