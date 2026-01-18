import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_notifications_result.dart';

/// 通知一覧を取得するユースケース。
class GetNotificationsUseCase {
  GetNotificationsUseCase(this._repository);

  final NotificationRepository _repository;

  Future<GetNotificationsResult> call({bool unreadOnly = true}) async {
    try {
      final items = await _repository.getNotifications(unreadOnly: unreadOnly);
      return GetNotificationsResult.success(items);
    } catch (_) {
      return const GetNotificationsResult.serverError();
    }
  }
}


