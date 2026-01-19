import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/get_lounge_info_result.dart';

/// ラウンジ情報を取得するユースケース。
class GetLoungeInfoUseCase {
  GetLoungeInfoUseCase(this._repository);

  final LoungeRepository _repository;

  Future<GetLoungeInfoResult> call({required int loungeId}) async {
    try {
      final info = await _repository.getLoungeInfo(loungeId: loungeId);
      return GetLoungeInfoResult.success(info);
    } catch (_) {
      return const GetLoungeInfoResult.serverError();
    }
  }
}


