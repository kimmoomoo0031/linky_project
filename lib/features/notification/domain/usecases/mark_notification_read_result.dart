import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_notification_read_result.freezed.dart';

/// 通知既読結果を表すドメイン用 Union 型。
@freezed
class MarkNotificationReadResult with _$MarkNotificationReadResult {
  /// 既読成功。
  const factory MarkNotificationReadResult.success() =
      MarkNotificationReadSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory MarkNotificationReadResult.networkError() =
      MarkNotificationReadNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory MarkNotificationReadResult.serverError() =
      MarkNotificationReadServerError;
}


