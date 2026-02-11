import 'dart:math';

import 'package:linky_project_0318/features/post/domain/entities/comment_item.dart';
import 'package:linky_project_0318/features/post/enums/comment_sort.dart';
import 'package:linky_project_0318/features/post/domain/repositories/comment_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeCommentRepository implements CommentRepository {
  final _rand = Random(7);

  /// postId -> comments
  final Map<String, List<CommentItem>> _store = {};

  List<CommentItem> _seed(String postId) {
    final now = DateTime.now();
    final parent1 = CommentItem(
      id: 'c_${postId}_1',
      postId: postId,
      authorNickname: 'リンゴ',
      authorIsGuest: false,
      createdAt: now.subtract(const Duration(minutes: 45)),
      content: 'テストタイトルですテストタイトルです',
      parentCommentId: null,
      isDeleted: false,
      deletedAt: null,
      canDelete: false,
    );
    final reply1 = CommentItem(
      id: 'c_${postId}_2',
      postId: postId,
      authorNickname: 'パイナップル',
      authorIsGuest: false,
      createdAt: now.subtract(const Duration(minutes: 30)),
      content: 'テストタイトルですテストタイトルです',
      parentCommentId: parent1.id,
      isDeleted: false,
      deletedAt: null,
      canDelete: true, // 自分コメント想定（UI確認用）
    );
    final parent2 = CommentItem(
      id: 'c_${postId}_3',
      postId: postId,
      authorNickname: 'リンゴ',
      authorIsGuest: false,
      createdAt: now.subtract(const Duration(minutes: 20)),
      content: 'ユーザーが削除したコメントです',
      parentCommentId: null,
      isDeleted: true,
      deletedAt: now.subtract(const Duration(minutes: 10)),
      canDelete: false,
    );
    final reply2 = CommentItem(
      id: 'c_${postId}_4',
      postId: postId,
      authorNickname: 'パイナップル',
      authorIsGuest: false,
      createdAt: now.subtract(const Duration(minutes: 18)),
      content: '削除されたコメントです',
      parentCommentId: parent2.id,
      isDeleted: true,
      deletedAt: now.subtract(const Duration(minutes: 9)),
      canDelete: false,
    );
    return [parent1, reply1, parent2, reply2];
  }

  List<CommentItem> _ensurePost(String postId) {
    return _store.putIfAbsent(postId, () => _seed(postId));
  }

  @override
  Future<List<CommentItem>> getComments({
    required String postId,
    required CommentSort sort,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final list = [..._ensurePost(postId)];
    list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    if (sort == CommentSort.createdAtDesc) {
      return list.reversed.toList();
    }
    return list;
  }

  @override
  Future<CommentItem> createComment({
    required String postId,
    required String content,
    String? parentCommentId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final now = DateTime.now();
    final id = 'c_${postId}_${now.microsecondsSinceEpoch}';
    final item = CommentItem(
      id: id,
      postId: postId,
      authorNickname: '自分',
      authorIsGuest: false,
      createdAt: now,
      content: content,
      parentCommentId: parentCommentId,
      isDeleted: false,
      deletedAt: null,
      canDelete: true,
    );
    _ensurePost(postId).add(item);
    return item;
  }

  @override
  Future<CommentItem> createGuestComment({
    required String postId,
    required String nickname,
    required String password,
    required String content,
    String? parentCommentId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final now = DateTime.now();
    final id =
        'gc_${postId}_${now.microsecondsSinceEpoch}_${_rand.nextInt(999)}';
    final item = CommentItem(
      id: id,
      postId: postId,
      authorNickname: nickname,
      authorIsGuest: true,
      createdAt: now,
      content: content,
      parentCommentId: parentCommentId,
      isDeleted: false,
      deletedAt: null,
      canDelete: true,
    );
    _ensurePost(postId).add(item);
    return item;
  }

  @override
  Future<void> deleteComment({
    required String commentId,
    String? guestPassword,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    for (final entry in _store.entries) {
      final idx = entry.value.indexWhere((c) => c.id == commentId);
      if (idx < 0) continue;

      final cur = entry.value[idx];
      entry.value[idx] = cur.copyWith(
        isDeleted: true,
        deletedAt: DateTime.now(),
      );
      return;
    }
  }
}


