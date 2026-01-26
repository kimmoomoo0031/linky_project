import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/data/repositories/fake_lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_best_posts_usecase.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_info_usecase.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_posts_usecase.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/create_lounge_post_usecase.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounge_posts_usecase.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounges_usecase.dart';

/// Lounge 機能の DI（依存関係のつなぎ込み）。
final loungeRepositoryProvider = Provider<LoungeRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeLoungeRepository();
});

final getLoungeInfoUseCaseProvider = Provider<GetLoungeInfoUseCase>((ref) {
  return GetLoungeInfoUseCase(ref.read(loungeRepositoryProvider));
});

final getLoungePostsUseCaseProvider = Provider<GetLoungePostsUseCase>((ref) {
  return GetLoungePostsUseCase(ref.read(loungeRepositoryProvider));
});

final getLoungeBestPostsUseCaseProvider =
    Provider<GetLoungeBestPostsUseCase>((ref) {
  return GetLoungeBestPostsUseCase(ref.read(loungeRepositoryProvider));
});

final createLoungePostUseCaseProvider =
    Provider<CreateLoungePostUseCase>((ref) {
  return CreateLoungePostUseCase(ref.read(loungeRepositoryProvider));
});

final searchLoungesUseCaseProvider = Provider<SearchLoungesUseCase>((ref) {
  return SearchLoungesUseCase(ref.read(loungeRepositoryProvider));
});

final searchLoungePostsUseCaseProvider =
    Provider<SearchLoungePostsUseCase>((ref) {
  return SearchLoungePostsUseCase(ref.read(loungeRepositoryProvider));
});


