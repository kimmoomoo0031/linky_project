import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/router/app_route_names.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_new_password_page.dart';

/// ルーティング呼び出しを1箇所に集約するための拡張。
///
/// - 画面側は `context.goLounge(...)` のような “意図” ベースの API を使う
/// - URL 文字列（`/lounge/$id?tab=...`）の直書きを禁止できる
extension LinkyRouterX on BuildContext {
  void goHome() {
    goNamed(AppRouteNames.home);
  }

  void goLogin() {
    goNamed(AppRouteNames.login);
  }

  void goWithdrawCompleted() {
    goNamed(AppRouteNames.withdrawCompleted);
  }

  void goSignUpSuccess() {
    goNamed(AppRouteNames.signUpSuccess);
  }

  void goPasswordResetSuccess() {
    goNamed(AppRouteNames.passwordResetSuccess);
  }

  void pushNotifications() {
    pushNamed(AppRouteNames.notifications);
  }

  void pushNotificationSettings() {
    pushNamed(AppRouteNames.notificationSettings);
  }

  void pushMyPosts() {
    pushNamed(AppRouteNames.myPosts);
  }

  void pushProfileEdit() {
    pushNamed(AppRouteNames.profileEdit);
  }

  void pushWithdraw() {
    pushNamed(AppRouteNames.withdraw);
  }

  void pushPostCreate() {
    pushNamed(AppRouteNames.postCreate);
  }

  void pushLoungePostSearch() {
    pushNamed(AppRouteNames.loungePostSearch);
  }

  void pushLoungeSearch() {
    pushNamed(AppRouteNames.loungeSearch);
  }

  void pushLoungeCreate() {
    pushNamed(AppRouteNames.loungeCreate);
  }

  void pushTerms() {
    pushNamed(AppRouteNames.terms);
  }

  void pushSignUp() {
    pushNamed(AppRouteNames.signUp);
  }

  void pushPasswordReset() {
    pushNamed(AppRouteNames.passwordReset);
  }

  void pushPasswordResetCode(String email) {
    pushNamed(
      AppRouteNames.passwordResetCode,
      extra: email,
    );
  }

  void pushPasswordResetNewPassword({
    required String email,
    required String code,
  }) {
    pushNamed(
      AppRouteNames.passwordResetNewPassword,
      extra: PasswordResetNewPasswordArgs(email: email, code: code),
    );
  }

  /// ラウンジ内タブへ移動（履歴を積まない用途）。
  void goLounge(
    int loungeId, {
    LoungeTab tab = LoungeTab.home,
    String? loungeTitle,
  }) {
    goNamed(
      AppRouteNames.lounge,
      pathParameters: {'id': loungeId.toString()},
      queryParameters: {'tab': tab.toQuery()},
      extra: loungeTitle,
    );
  }

  /// ラウンジへ遷移（履歴を積む用途）。
  void pushLounge(
    int loungeId, {
    LoungeTab tab = LoungeTab.home,
    String? loungeTitle,
  }) {
    pushNamed(
      AppRouteNames.lounge,
      pathParameters: {'id': loungeId.toString()},
      queryParameters: {'tab': tab.toQuery()},
      extra: loungeTitle,
    );
  }
}


