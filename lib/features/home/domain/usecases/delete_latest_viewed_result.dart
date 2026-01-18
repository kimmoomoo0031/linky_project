import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_latest_viewed_result.freezed.dart';

/// 最新閲覧（最近閲覧）削除結果を表すドメイン用 Union 型。
@freezed
class DeleteLatestViewedResult with _$DeleteLatestViewedResult {
  /// 削除成功。
  const factory DeleteLatestViewedResult.success() = DeleteLatestViewedSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory DeleteLatestViewedResult.networkError() =
      DeleteLatestViewedNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory DeleteLatestViewedResult.serverError() =
      DeleteLatestViewedServerError;
}


