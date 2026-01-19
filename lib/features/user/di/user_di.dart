import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/user/data/repositories/fake_user_repository.dart';
import 'package:linky_project_0318/features/user/domain/repositories/user_repository.dart';
import 'package:linky_project_0318/features/user/domain/usecases/get_my_profile_usecase.dart';
import 'package:linky_project_0318/features/user/domain/usecases/update_my_profile_usecase.dart';

/// User 機能の DI（依存関係のつなぎ込み）。
final userRepositoryProvider = Provider<UserRepository>((ref) {
  // TODO(api): API 実装に差し替える。
  return FakeUserRepository();
});

final getMyProfileUseCaseProvider = Provider<GetMyProfileUseCase>((ref) {
  return GetMyProfileUseCase(ref.read(userRepositoryProvider));
});

final updateMyProfileUseCaseProvider =
    Provider<UpdateMyProfileUseCase>((ref) {
  return UpdateMyProfileUseCase(ref.read(userRepositoryProvider));
});


