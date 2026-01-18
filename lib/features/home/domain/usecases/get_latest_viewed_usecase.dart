import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';
import 'package:linky_project_0318/features/home/domain/usecases/get_latest_viewed_result.dart';

/// 最新閲覧（最近閲覧）をページングで取得するユースケース。
class GetLatestViewedUseCase {
  GetLatestViewedUseCase(this._repository);

  final HomeRepository _repository;

  Future<GetLatestViewedResult> call({
    required int page,
    required int pageSize,
  }) async {
    try {
      final result =
          await _repository.getLatestViewed(page: page, pageSize: pageSize);
      return GetLatestViewedResult.success(result);
    } catch (_) {
      return const GetLatestViewedResult.serverError();
    }
  }
}


