import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/features/app/presentation/pages/splash_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/login_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/register_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/register_success_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_code_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_new_password_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_success_page.dart';
import 'package:linky_project_0318/features/home/presentation/pages/home_main_page.dart';
import 'package:linky_project_0318/features/post/presentation/pages/my_posts_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/profile_edit_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_search_page.dart';

import 'package:linky_project_0318/features/auth/presentation/pages/terms_of_service_page.dart';

/// アプリ全体のルーティング設定。
///
/// 今はスプラッシュとログインのみ定義し、今後ホームやその他画面を追加していく。
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeMainPage(),
    ),
    GoRoute(
      path: '/myPosts',
      name: 'myPosts',
      builder: (BuildContext context, GoRouterState state) =>
          const MyPostsPage(),
    ),
    GoRoute(
      path: '/profileEdit',
      name: 'profileEdit',
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileEditPage(),
    ),
    GoRoute(
      path: '/loungeSearch',
      name: 'loungeSearch',
      builder: (BuildContext context, GoRouterState state) =>
          const LoungeSearchPage(),
    ),
    GoRoute(
      path: '/terms',
      name: 'terms',
      builder: (BuildContext context, GoRouterState state) =>
      const TermsOfServicePage(),
    ),
    GoRoute(
      path: '/signUp',
      name: 'signUp',
      builder: (BuildContext context, GoRouterState state) =>
      const RegisterPage(),
    ),
    GoRoute(
      path: '/signUpSuccess',
      name: 'signUpSuccess',
      builder: (BuildContext context, GoRouterState state) =>
      const RegisterSuccessPage(),
    ),
    GoRoute(
      path: '/passwordReset',
      name: 'passwordReset',
      builder: (BuildContext context, GoRouterState state) =>
          const PasswordResetPage(),
    ),
    GoRoute(
      path: '/passwordResetCode',
      name: 'passwordResetCode',
      builder: (BuildContext context, GoRouterState state) =>
          PasswordResetCodePage(
        email: (state.extra as String?) ?? '',
      ),
    ),
    GoRoute(
      path: '/passwordResetNewPassword',
      name: 'passwordResetNewPassword',
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as PasswordResetNewPasswordArgs?;
        return PasswordResetNewPasswordPage(
          email: args?.email ?? '',
          code: args?.code ?? '',
        );
      },
    ),
    GoRoute(
      path: '/passwordResetSuccess',
      name: 'passwordResetSuccess',
      builder: (BuildContext context, GoRouterState state) =>
          const PasswordResetSuccessPage(),
    ),
  ],
);


