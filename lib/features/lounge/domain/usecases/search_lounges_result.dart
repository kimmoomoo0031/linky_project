import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';

part 'search_lounges_result.freezed.dart';

/// ラウンジ検索結果を表すドメイン用 Union 型。
@freezed
class SearchLoungesResult with _$SearchLoungesResult {
  /// 取得成功。
  const factory SearchLoungesResult.success(LoungeSearchPage page) =
      SearchLoungesSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory SearchLoungesResult.networkError() = SearchLoungesNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory SearchLoungesResult.serverError() = SearchLoungesServerError;
}


