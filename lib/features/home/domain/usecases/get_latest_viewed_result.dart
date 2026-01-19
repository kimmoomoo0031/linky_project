import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/home/domain/repositories/home_repository.dart';

part 'get_latest_viewed_result.freezed.dart';

/// 最新閲覧（最近閲覧）取得結果を表すドメイン用 Union 型。
@freezed
class GetLatestViewedResult with _$GetLatestViewedResult {
  /// 取得成功。
  const factory GetLatestViewedResult.success(LoungePreviewPage page) =
      GetLatestViewedSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetLatestViewedResult.networkError() =
      GetLatestViewedNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetLatestViewedResult.serverError() =
      GetLatestViewedServerError;
}


