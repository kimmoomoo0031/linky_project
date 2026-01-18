import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/update_notification_settings_result.dart';

/// 通知設定を更新するユースケース。
class UpdateNotificationSettingsUseCase {
  UpdateNotificationSettingsUseCase(this._repository);

  final NotificationRepository _repository;

  Future<UpdateNotificationSettingsResult> call(
    NotificationSettings settings,
  ) async {
    try {
      await _repository.updateSettings(settings);
      return const UpdateNotificationSettingsResult.success();
    } catch (_) {
      return const UpdateNotificationSettingsResult.serverError();
    }
  }
}


