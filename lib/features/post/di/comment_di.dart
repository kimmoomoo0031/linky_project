import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/post/domain/repositories/fake_comment_repository.dart';
import 'package:linky_project_0318/features/post/domain/repositories/comment_repository.dart';

/// Post/Comment 機能の DI（依存関係のつなぎ込み）。
final commentRepositoryProvider = Provider<CommentRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeCommentRepository();
});


