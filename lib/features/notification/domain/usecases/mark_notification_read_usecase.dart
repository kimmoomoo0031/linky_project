import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/mark_notification_read_result.dart';

/// 通知を既読にするユースケース。
class MarkNotificationReadUseCase {
  MarkNotificationReadUseCase(this._repository);

  final NotificationRepository _repository;

  Future<MarkNotificationReadResult> call(String notificationId) async {
    try {
      await _repository.markAsRead(notificationId);
      return const MarkNotificationReadResult.success();
    } catch (_) {
      return const MarkNotificationReadResult.serverError();
    }
  }
}


