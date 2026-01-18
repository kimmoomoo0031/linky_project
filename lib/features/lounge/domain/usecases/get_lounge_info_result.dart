import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_info.dart';

part 'get_lounge_info_result.freezed.dart';

/// ラウンジ情報取得結果を表すドメイン用 Union 型。
@freezed
class GetLoungeInfoResult with _$GetLoungeInfoResult {
  /// 取得成功。
  const factory GetLoungeInfoResult.success(LoungeInfo info) =
      GetLoungeInfoSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetLoungeInfoResult.networkError() =
      GetLoungeInfoNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetLoungeInfoResult.serverError() =
      GetLoungeInfoServerError;
}


