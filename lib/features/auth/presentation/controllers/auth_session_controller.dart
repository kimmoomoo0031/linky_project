import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/auth/di/auth_di.dart';

/// セッション操作（ログアウト等）を扱う Controller.
///
/// UI は「意図」だけを投げ、Repository 呼び出しや状態はここに集約する。
class AuthSessionController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // no-op
  }

  /// ログアウト処理（サーバー通知 / ローカルセッション破棄など）はここで行う。
  /// 画面遷移は UI 側の責務にする（A方針）。
  Future<void> logout() async {
    // 連打抑止
    if (state.isLoading) return;

    final repo = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    try {
      await repo.logout();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
