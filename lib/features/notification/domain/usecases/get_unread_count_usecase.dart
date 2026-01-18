import 'package:linky_project_0318/features/notification/domain/repositories/notification_repository.dart';
import 'package:linky_project_0318/features/notification/domain/usecases/get_unread_count_result.dart';

/// 未読通知件数を取得するユースケース。
class GetUnreadCountUseCase {
  GetUnreadCountUseCase(this._repository);

  final NotificationRepository _repository;

  Future<GetUnreadCountResult> call() async {
    try {
      final count = await _repository.getUnreadCount();
      return GetUnreadCountResult.success(count);
    } catch (_) {
      return const GetUnreadCountResult.serverError();
    }
  }
}


