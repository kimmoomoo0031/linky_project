import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_notification_settings_result.dart';

/// 通知設定を取得するユースケース。
class GetNotificationSettingsUseCase {
  GetNotificationSettingsUseCase(this._repository);

  final NotificationRepository _repository;

  Future<GetNotificationSettingsResult> call() async {
    try {
      final settings = await _repository.getSettings();
      return GetNotificationSettingsResult.success(settings);
    } catch (_) {
      return const GetNotificationSettingsResult.serverError();
    }
  }
}


