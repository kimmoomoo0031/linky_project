import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:linky_project_0318/core/constants/api_endpoints.dart';

part 'notification_api_service.g.dart';

/// 通知関連の API クライアント。
@RestApi()
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String baseUrl}) =
      _NotificationApiService;

  /// 自分宛ての通知一覧。
  @GET(ApiEndpoints.notifications)
  Future<dynamic> getNotifications(); // List<dynamic> → dynamic

  /// 未読通知件数。
  @GET(ApiEndpoints.notificationsUnreadCount)
  Future<dynamic> getUnreadCount();

  /// 通知を既読にする。
  @PUT(ApiEndpoints.notificationReadTemplate)
  Future<void> markAsRead(
    @Path('id') String notificationId,
  );

  /// 通知設定の取得。
  @GET(ApiEndpoints.notificationSettings)
  Future<dynamic> getNotificationSettings();

  /// 通知設定の更新。
  @PUT(ApiEndpoints.notificationSettings)
  Future<dynamic> updateNotificationSettings(
    @Body() Map<String, dynamic> body,
  );
}

