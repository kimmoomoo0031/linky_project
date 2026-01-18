import 'package:linky_project_0318/features/user/domain/repositories/user_repository.dart';
import 'package:linky_project_0318/features/user/domain/usecases/get_my_profile_result.dart';

/// 自分のプロフィールを取得するユースケース。
class GetMyProfileUseCase {
  GetMyProfileUseCase(this._repository);

  final UserRepository _repository;

  Future<GetMyProfileResult> call() async {
    try {
      final profile = await _repository.getMyProfile();
      return GetMyProfileResult.success(profile);
    } catch (_) {
      return const GetMyProfileResult.serverError();
    }
  }
}


