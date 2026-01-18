import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';

part 'get_notification_settings_result.freezed.dart';

/// 通知設定取得結果を表すドメイン用 Union 型。
@freezed
class GetNotificationSettingsResult with _$GetNotificationSettingsResult {
  /// 取得成功。
  const factory GetNotificationSettingsResult.success(
    NotificationSettings settings,
  ) = GetNotificationSettingsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetNotificationSettingsResult.networkError() =
      GetNotificationSettingsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetNotificationSettingsResult.serverError() =
      GetNotificationSettingsServerError;
}


