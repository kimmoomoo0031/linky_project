import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/repositories/fake_user_repository.dart';
import 'domain/repositories/user_repository.dart';

/// User 機能の DI（依存関係のつなぎ込み）。
final userRepositoryProvider = Provider<UserRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeUserRepository();
});


