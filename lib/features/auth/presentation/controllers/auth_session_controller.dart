import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/repositories/auth_repository.dart';

/// セッション操作（ログアウト等）を扱う Controller.
///
/// UI は「意図」だけを投げ、Repository 呼び出しや状態はここに集約する。
class AuthSessionController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // no-op
  }

  Future<void> logout(AuthRepository repo) async {
    // 連打抑止
    if (state.isLoading) return;

    state = const AsyncLoading();
    try {
      await repo.logout();
      state = const AsyncData(null);

      // ルート遷移（UIに依存しない）
      appRouter.go('/login');
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
