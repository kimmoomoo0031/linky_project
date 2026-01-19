import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_notification_settings_result.freezed.dart';

/// 通知設定更新結果を表すドメイン用 Union 型。
@freezed
class UpdateNotificationSettingsResult
    with _$UpdateNotificationSettingsResult {
  /// 更新成功。
  const factory UpdateNotificationSettingsResult.success() =
      UpdateNotificationSettingsSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory UpdateNotificationSettingsResult.networkError() =
      UpdateNotificationSettingsNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory UpdateNotificationSettingsResult.serverError() =
      UpdateNotificationSettingsServerError;
}


