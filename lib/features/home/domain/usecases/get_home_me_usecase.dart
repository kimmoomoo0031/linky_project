import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_home_me_result.dart';

/// ホーム画面の自分情報を取得するユースケース。
class GetHomeMeUseCase {
  GetHomeMeUseCase(this._repository);

  final HomeRepository _repository;

  Future<GetHomeMeResult> call() async {
    try {
      final user = await _repository.getMe();
      return GetHomeMeResult.success(user);
    } catch (_) {
      return const GetHomeMeResult.serverError();
    }
  }
}


