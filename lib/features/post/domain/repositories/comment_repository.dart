import 'package:linky_project_0318/features/post/domain/entities/comment_item.dart';
import 'package:linky_project_0318/features/post/enums/comment_sort.dart';

abstract class CommentRepository {
  Future<List<CommentItem>> getComments({
    required String postId,
    required CommentSort sort,
  });

  Future<CommentItem> createComment({
    required String postId,
    required String content,
    String? parentCommentId,
  });

  Future<CommentItem> createGuestComment({
    required String postId,
    required String nickname,
    required String password,
    required String content,
    String? parentCommentId,
  });

  Future<void> deleteComment({
    required String commentId,
    String? guestPassword,
  });
}


