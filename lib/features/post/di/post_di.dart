import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/fake_post_repository.dart';
import '../domain/repositories/post_repository.dart';

/// Post 機能の DI（依存関係のつなぎ込み）。
final postRepositoryProvider = Provider<PostRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakePostRepository();
});


