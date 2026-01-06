import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/router/main_shell_scaffold.dart';
import 'package:linky_project_0318/features/app/presentation/pages/splash_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/login_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/register_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/register_success_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_code_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_new_password_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/password_reset_success_page.dart';
import 'package:linky_project_0318/features/home/presentation/pages/home_main_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_best_page.dart';
import 'package:linky_project_0318/features/post/presentation/pages/my_posts_page.dart';
import 'package:linky_project_0318/features/post/presentation/pages/post_create_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/profile_edit_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/withdraw_completed_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/withdraw_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_search_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_create_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_main_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_info_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_post_search_page.dart';
import 'package:linky_project_0318/features/notification/presentation/pages/notification_settings_page.dart';
import 'package:linky_project_0318/features/notification/presentation/pages/notification_list_page.dart';

import 'package:linky_project_0318/features/auth/presentation/pages/terms_of_service_page.dart';

/// アプリ全体のルーティング設定。
///
/// 今はスプラッシュとログインのみ定義し、今後ホームやその他画面を追加していく。
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
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

    // ボトムナビ表示領域（ラウンジ/ベスト）。
    // 方針:
    // - BottomNav の「タブ」は go()（履歴を積まない）
    // - 検索/作成などは push()（フローとして積む）
    ShellRoute(
      builder: (context, state, child) {
        return MainShellScaffold(
          location: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/tabs/lounge',
          name: 'loungeTab',
          redirect: (context, state) {
            final idStr = state.uri.queryParameters['loungeId'];
            final loungeId = int.tryParse(idStr ?? '');
            if (loungeId == null) return '/home';
            return null;
          },
          builder: (context, state) {
            final idStr = state.uri.queryParameters['loungeId'];
            final loungeId = int.parse(idStr!);
            return LoungeInfoPage(loungeId: loungeId);
          },
        ),
        GoRoute(
          path: '/tabs/best',
          name: 'bestTab',
          builder: (context, state) => const LoungeBestPage(),
        ),
        GoRoute(
          path: '/lounge/:id',
          name: 'loungeMain',
          builder: (BuildContext context, GoRouterState state) {
            final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
            final title = (state.extra as String?) ?? 'ラウンジ';
            return LoungeMainPage(
              loungeId: id,
              loungeTitle: title,
            );
          },
        ),
      ],
    ),

    // ラウンジ内の投稿検索（ボトムナビ非表示）
    GoRoute(
      path: '/loungePostSearch',
      name: 'loungePostSearch',
      builder: (context, state) => const LoungePostSearchPage(),
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
      path: '/withdraw',
      name: 'withdraw',
      builder: (BuildContext context, GoRouterState state) =>
          const WithdrawPage(),
    ),
    GoRoute(
      path: '/withdrawCompleted',
      name: 'withdrawCompleted',
      builder: (BuildContext context, GoRouterState state) =>
          const WithdrawCompletedPage(),
    ),
    GoRoute(
      path: '/notificationSettings',
      name: 'notificationSettings',
      builder: (BuildContext context, GoRouterState state) =>
          const NotificationSettingsPage(),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (BuildContext context, GoRouterState state) =>
          const NotificationListPage(),
    ),
    GoRoute(
      path: '/loungeSearch',
      name: 'loungeSearch',
      builder: (BuildContext context, GoRouterState state) =>
          const LoungeSearchPage(),
    ),
    GoRoute(
      path: '/loungeCreate',
      name: 'loungeCreate',
      builder: (BuildContext context, GoRouterState state) =>
          const LoungeCreatePage(),
    ),

    // 投稿作成（ボトムナビ非表示）
    GoRoute(
      path: '/post/create',
      name: 'postCreate',
      builder: (context, state) => const PostCreatePage(),
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


