/// Auth 機能の Provider 群（barrel）。
///
/// 互換性のため `features/auth/auth_providers.dart` は残しつつ、
/// 実体は以下へ分割する：
/// - `di/`：Repository / UseCase などの DI
/// - `presentation/providers/`：画面向け Provider
export 'di/auth_di.dart';

export 'presentation/providers/auth_session_providers.dart';
export 'presentation/providers/login_providers.dart';
export 'presentation/providers/password_reset_new_password_providers.dart';
export 'presentation/providers/password_reset_providers.dart';
export 'presentation/providers/register_providers.dart';
