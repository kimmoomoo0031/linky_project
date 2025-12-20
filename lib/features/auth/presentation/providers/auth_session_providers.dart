import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/auth_session_controller.dart';

/// セッション操作（ログアウト等）用。
final authSessionControllerProvider =
    AsyncNotifierProvider<AuthSessionController, void>(AuthSessionController.new);


