import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/login_state.dart';

import 'data/repositories/fake_auth_repository.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'presentation/controllers/login_controller.dart';

/// Auth 機能全体の DI（依存関係のつなぎ込み）を行う Provider 群。
///
/// data / domain / presentation をまたいで依存を組み立てる「コンポジションルート」的な役割。
///
/// TODO(api): Dio / Retrofit ベースの AuthRepositoryImpl を実装したら、
///            authRepositoryProvider の中身を FakeAuthRepository から差し替える。

/// 認証用リポジトリ。
/// まずは Fake 実装を使い、あとで API 実装に差し替える。
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FakeAuthRepository();
});

/// ログインユースケース。
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUseCase(repo);
});

/// ログイン画面用 StateNotifierProvider。
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  final useCase = ref.watch(loginUseCaseProvider);
  return LoginController(useCase);
});


