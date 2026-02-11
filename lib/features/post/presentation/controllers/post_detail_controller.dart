import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/features/post/di/comment_di.dart';
import 'package:linky_project_0318/features/post/domain/entities/comment_item.dart';
import 'package:linky_project_0318/features/post/enums/comment_sort.dart';
import 'package:linky_project_0318/features/post/enums/reaction_type.dart';
import 'package:linky_project_0318/features/post/di/post_di.dart';
import 'package:linky_project_0318/features/post/domain/entities/post_detail.dart';
import 'package:linky_project_0318/features/post/presentation/providers/post_providers.dart';

class PostDetailViewData {
  const PostDetailViewData({
    required this.post,
    required this.comments,
    required this.sort,
    required this.isRefreshingComments,
    required this.isReacting,
    required this.replyToCommentId,
    required this.replyToNickname,
  });

  final PostDetail post;
  final List<CommentItem> comments;
  final CommentSort sort;
  final bool isRefreshingComments;
  final bool isReacting;

  /// null: 通常コメント / not null: 返信モード
  final String? replyToCommentId;
  final String? replyToNickname;

  PostDetailViewData copyWith({
    PostDetail? post,
    List<CommentItem>? comments,
    CommentSort? sort,
    bool? isRefreshingComments,
    bool? isReacting,
    String? replyToCommentId,
    String? replyToNickname,
    bool clearReplyTo = false,
  }) {
    return PostDetailViewData(
      post: post ?? this.post,
      comments: comments ?? this.comments,
      sort: sort ?? this.sort,
      isRefreshingComments: isRefreshingComments ?? this.isRefreshingComments,
      isReacting: isReacting ?? this.isReacting,
      replyToCommentId:
          clearReplyTo ? null : (replyToCommentId ?? this.replyToCommentId),
      replyToNickname:
          clearReplyTo ? null : (replyToNickname ?? this.replyToNickname),
    );
  }
}

class PostDetailController
    extends AutoDisposeFamilyAsyncNotifier<PostDetailViewData, String> {
  void _emitSnack(String message) {
    ref.read(postDetailSnackEventProvider.notifier).state = message;
  }

  @override
  Future<PostDetailViewData> build(String postId) async {
    final post = await ref.read(postRepositoryProvider).getPostDetail(
          postId: postId,
        );
    final comments = await ref.read(commentRepositoryProvider).getComments(
          postId: postId,
          sort: CommentSort.createdAtAsc,
        );
    return PostDetailViewData(
      post: post.copyWith(commentCount: comments.length),
      comments: comments,
      sort: CommentSort.createdAtAsc,
      isRefreshingComments: false,
      isReacting: false,
      replyToCommentId: null,
      replyToNickname: null,
    );
  }

  Future<void> refreshComments() async {
    final cur = state.valueOrNull;
    if (cur == null) return;
    if (cur.isRefreshingComments) return;

    state = AsyncData(cur.copyWith(isRefreshingComments: true));
    try {
      final list = await ref.read(commentRepositoryProvider).getComments(
            postId: cur.post.id,
            sort: cur.sort,
          );
      final nextPost = cur.post.copyWith(
        commentCount: list.length,
      );
      state = AsyncData(
        cur.copyWith(
          post: nextPost,
          comments: list,
          isRefreshingComments: false,
        ),
      );
    } catch (_) {
      state = AsyncData(cur.copyWith(isRefreshingComments: false));
      _emitSnack(CommonMessages.errors.unexpected.message);
    }
  }

  Future<void> setSort(CommentSort sort) async {
    final cur = state.valueOrNull;
    if (cur == null) return;
    if (cur.sort == sort) return;
    state = AsyncData(cur.copyWith(sort: sort));
    await refreshComments();
  }

  void setReplyTo({required String? commentId, required String? nickname}) {
    final cur = state.valueOrNull;
    if (cur == null) return;
    state = AsyncData(
      cur.copyWith(
        replyToCommentId: commentId,
        replyToNickname: nickname,
        clearReplyTo: commentId == null,
      ),
    );
  }

  Future<void> like() async {
    await _react(ReactionType.like);
  }

  Future<void> dislike() async {
    await _react(ReactionType.dislike);
  }

  Future<void> _react(ReactionType type) async {
    final cur = state.valueOrNull;
    if (cur == null) return;
    if (cur.isReacting) return;

    // 1回投票したら固定（取消/切替なし）
    if (cur.post.myReaction != ReactionType.none) {
      _emitSnack(CommonMessages.failures.alreadyReacted.message);
      return;
    }

    // optimistic
    final prev = cur.post;
    final optimistic = switch (type) {
      ReactionType.like => cur.post.copyWith(
          likeCount: cur.post.likeCount + 1,
          myReaction: ReactionType.like,
        ),
      ReactionType.dislike => cur.post.copyWith(
          dislikeCount: cur.post.dislikeCount + 1,
          myReaction: ReactionType.dislike,
        ),
      ReactionType.none => cur.post,
    };
    state = AsyncData(cur.copyWith(post: optimistic, isReacting: true));

    try {
      final repo = ref.read(postRepositoryProvider);
      final counts = type == ReactionType.like
          ? await repo.likePost(postId: cur.post.id)
          : await repo.dislikePost(postId: cur.post.id);
      final nextPost = optimistic.copyWith(
        likeCount: counts.likeCount,
        dislikeCount: counts.dislikeCount,
      );
      state = AsyncData(cur.copyWith(post: nextPost, isReacting: false));
    } on AppErrorUnauthorized {
      state = AsyncData(cur.copyWith(post: prev, isReacting: false));
      _emitSnack(const AppErrorUnauthorized().userMessage());
    } catch (_) {
      state = AsyncData(cur.copyWith(post: prev, isReacting: false));
      _emitSnack(CommonMessages.errors.unexpected.message);
    }
  }

  Future<void> deleteComment({
    required String commentId,
    String? guestPassword,
  }) async {
    final cur = state.valueOrNull;
    if (cur == null) return;

    try {
      await ref.read(commentRepositoryProvider).deleteComment(
            commentId: commentId,
            guestPassword: guestPassword,
          );

      // UIは「削除されたコメントです」表示にするため、ローカルでも即反映
      final now = DateTime.now();
      final next = cur.comments.map((c) {
        if (c.id != commentId) return c;
        return c.copyWith(isDeleted: true, deletedAt: now);
      }).toList();
      state = AsyncData(cur.copyWith(comments: next));
    } catch (_) {
      _emitSnack(CommonMessages.errors.deleteFailed.message);
    }
  }
}


