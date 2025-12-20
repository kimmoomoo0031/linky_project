import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/fake_auth_repository.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/register_usecase.dart';
import '../domain/usecases/reset_password_usecase.dart';

/// Auth 機能の DI（依存関係のつなぎ込み）。
///
/// - Repository / UseCase など「レイヤーをまたいで組み立てるもの」はここに集約する。
/// - UI（presentation）はここを直接 import せず、presentation/providers 経由で参照する。

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

/// 新規登録ユースケース。
final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repo);
});

/// 新パスワード設定ユースケース。
final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return ResetPasswordUseCase(repo);
});

