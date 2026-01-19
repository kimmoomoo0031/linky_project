import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/post/data/repositories/fake_post_repository.dart';
import 'package:linky_project_0318/features/post/domain/repositories/post_repository.dart';
import 'package:linky_project_0318/features/post/domain/usecases/get_my_posts_usecase.dart';

/// Post 機能の DI（依存関係のつなぎ込み）。
final postRepositoryProvider = Provider<PostRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakePostRepository();
});

final getMyPostsUseCaseProvider = Provider<GetMyPostsUseCase>((ref) {
  return GetMyPostsUseCase(ref.read(postRepositoryProvider));
});


