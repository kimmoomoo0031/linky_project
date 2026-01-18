import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_unread_count_result.freezed.dart';

/// 未読件数取得結果を表すドメイン用 Union 型。
@freezed
class GetUnreadCountResult with _$GetUnreadCountResult {
  /// 取得成功。
  const factory GetUnreadCountResult.success(int count) = GetUnreadCountSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetUnreadCountResult.networkError() =
      GetUnreadCountNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetUnreadCountResult.serverError() = GetUnreadCountServerError;
}


