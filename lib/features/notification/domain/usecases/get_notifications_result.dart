import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_item.dart';

part 'get_notifications_result.freezed.dart';

/// 通知一覧取得結果を表すドメイン用 Union 型。
@freezed
class GetNotificationsResult with _$GetNotificationsResult {
  /// 取得成功。
  const factory GetNotificationsResult.success(List<NotificationItem> items) =
      GetNotificationsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetNotificationsResult.networkError() =
      GetNotificationsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetNotificationsResult.serverError() =
      GetNotificationsServerError;
}


