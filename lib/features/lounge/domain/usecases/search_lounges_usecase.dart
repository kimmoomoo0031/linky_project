import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/search_lounges_result.dart';

/// ラウンジ検索を行うユースケース。
class SearchLoungesUseCase {
  SearchLoungesUseCase(this._repository);

  final LoungeRepository _repository;

  Future<SearchLoungesResult> call({
    required String query,
    required int cursor,
    required int limit,
  }) async {
    try {
      final page = await _repository.searchLounges(
        query: query,
        cursor: cursor,
        limit: limit,
      );
      return SearchLoungesResult.success(page);
    } catch (_) {
      return const SearchLoungesResult.serverError();
    }
  }
}


