import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';
import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_info.dart';

/// ラウンジ情報取得コントローラ（モック）。
class LoungeInfoController extends FamilyAsyncNotifier<LoungeInfo, int> {
  @override
  Future<LoungeInfo> build(int loungeId) async {
    final result =
        await ref.read(getLoungeInfoUseCaseProvider).call(loungeId: loungeId);
    return result.when(
      success: (info) => info,
      networkError: () => throw const AppErrorNetwork(),
      serverError: () => throw const AppErrorServer(),
    );
  }
}
