import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/features/app/presentation/pages/splash_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/login_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/register_page.dart';

import '../../features/auth/presentation/pages/terms_of_service_page.dart';

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
  ],
);


