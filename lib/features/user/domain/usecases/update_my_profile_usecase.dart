import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';
import 'package:linky_project_0318/features/user/domain/repositories/user_repository.dart';
import 'package:linky_project_0318/features/user/domain/usecases/update_my_profile_result.dart';

/// 自分のプロフィールを更新するユースケース。
class UpdateMyProfileUseCase {
  UpdateMyProfileUseCase(this._repository);

  final UserRepository _repository;

  Future<UpdateMyProfileResult> call(UserProfile profile) async {
    try {
      await _repository.updateMyProfile(profile);
      return const UpdateMyProfileResult.success();
    } catch (_) {
      return const UpdateMyProfileResult.serverError();
    }
  }
}


