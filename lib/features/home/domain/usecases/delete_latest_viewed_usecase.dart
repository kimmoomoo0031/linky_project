import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';
import 'package:linky_project_0318/features/home/domain/usecases/delete_latest_viewed_result.dart';

/// 最新閲覧（最近閲覧）から指定したラウンジを削除するユースケース。
class DeleteLatestViewedUseCase {
  DeleteLatestViewedUseCase(this._repository);

  final HomeRepository _repository;

  Future<DeleteLatestViewedResult> call({required int loungeId}) async {
    try {
      await _repository.deleteLatestViewed(loungeId: loungeId);
      return const DeleteLatestViewedResult.success();
    } catch (_) {
      return const DeleteLatestViewedResult.serverError();
    }
  }
}


