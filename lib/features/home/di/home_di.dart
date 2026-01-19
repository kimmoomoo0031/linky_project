import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/home/data/repositories/fake_home_repository.dart';
import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';
import 'package:linky_project_0318/features/home/domain/usecases/delete_latest_viewed_usecase.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_best_posts_usecase.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_home_me_usecase.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_latest_viewed_usecase.dart';

/// Home 機能の DI（依存関係のつなぎ込み）。
///
/// Controller から参照されても循環 import にならないように、Repository だけを分離しておく。
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  // TODO(api): Dio/Retrofit 実装に差し替える。
  return FakeHomeRepository();
});

final getHomeMeUseCaseProvider = Provider<GetHomeMeUseCase>((ref) {
  return GetHomeMeUseCase(ref.read(homeRepositoryProvider));
});

final getLatestViewedUseCaseProvider = Provider<GetLatestViewedUseCase>((ref) {
  return GetLatestViewedUseCase(ref.read(homeRepositoryProvider));
});

final deleteLatestViewedUseCaseProvider =
    Provider<DeleteLatestViewedUseCase>((ref) {
  return DeleteLatestViewedUseCase(ref.read(homeRepositoryProvider));
});

final getBestPostsUseCaseProvider = Provider<GetBestPostsUseCase>((ref) {
  return GetBestPostsUseCase(ref.read(homeRepositoryProvider));
});


