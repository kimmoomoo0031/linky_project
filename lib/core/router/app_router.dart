import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/router/app_route_names.dart';
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
import 'package:linky_project_0318/features/user/presentation/pages/profile_edit_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/withdraw_completed_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/withdraw_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_search_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_create_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_main_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_info_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_post_search_page.dart';
import 'package:linky_project_0318/features/lounge/presentation/pages/lounge_post_create_page.dart';
import 'package:linky_project_0318/features/notification/presentation/pages/notification_settings_page.dart';
import 'package:linky_project_0318/features/notification/presentation/pages/notification_list_page.dart';
import 'package:linky_project_0318/features/user/presentation/pages/settings_page.dart';
import 'package:linky_project_0318/features/post/presentation/pages/post_detail_page.dart';

import 'package:linky_project_0318/features/auth/presentation/pages/terms_of_service_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/privacy_policy_page.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/sign_up_agreement_page.dart';

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
      name: AppRouteNames.splash,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: AppRouteNames.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: AppRouteNames.home,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeMainPage(),
    ),

    GoRoute(
      path: '/posts/:postId',
      name: AppRouteNames.postDetail,
      builder: (context, state) {
        final postId = state.pathParameters['postId'] ?? '';
        return PostDetailPage(postId: postId);
      },
    ),

    // ボトムナビ表示領域（ラウンジ/ベスト）。
    // 方針:
    // - BottomNav の「タブ」は go()（履歴を積まない）
    // - 検索/作成などは push()（フローとして積む）
    ShellRoute(
      builder: (context, state, child) {
        return MainShellScaffold(
          // query（例: ?tab=best）も含めて渡し、タブ状態を正しく判定できるようにする
          location: state.uri.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/lounge/:id',
          name: AppRouteNames.lounge,
          builder: (BuildContext context, GoRouterState state) {
            final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
            final title = (state.extra as String?) ?? 'ラウンジ';
            final tab = LoungeTabX.fromQuery(state.uri.queryParameters['tab']);
            switch (tab) {
              case LoungeTab.info:
                return LoungeInfoPage(loungeId: id);
              case LoungeTab.best:
                return LoungeBestPage(loungeId: id);
              case LoungeTab.home:
                return LoungeMainPage(
                  loungeId: id,
                  loungeTitle: title,
                );
            }
          },
        ),
      ],
    ),

    GoRoute(
      path: '/loungePostSearch',
      name: AppRouteNames.loungePostSearch,
      builder: (context, state) => const LoungePostSearchPage(),
    ),
    GoRoute(
      path: '/lounge/:id/post/create',
      name: AppRouteNames.loungePostCreate,
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        final isGuest = (state.extra as bool?) ?? false;
        return LoungePostCreatePage(loungeId: id, isGuest: isGuest);
      },
    ),
    GoRoute(
      path: '/myPosts',
      name: AppRouteNames.myPosts,
      builder: (BuildContext context, GoRouterState state) =>
          const MyPostsPage(),
    ),
    GoRoute(
      path: '/profileEdit',
      name: AppRouteNames.profileEdit,
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileEditPage(),
    ),
    GoRoute(
      path: '/settings',
      name: AppRouteNames.settings,
      builder: (BuildContext context, GoRouterState state) =>
          const SettingsPage(),
    ),
    GoRoute(
      path: '/withdraw',
      name: AppRouteNames.withdraw,
      builder: (BuildContext context, GoRouterState state) =>
          const WithdrawPage(),
    ),
    GoRoute(
      path: '/withdrawCompleted',
      name: AppRouteNames.withdrawCompleted,
      builder: (BuildContext context, GoRouterState state) =>
          const WithdrawCompletedPage(),
    ),
    GoRoute(
      path: '/notificationSettings',
      name: AppRouteNames.notificationSettings,
      builder: (BuildContext context, GoRouterState state) =>
          const NotificationSettingsPage(),
    ),
    GoRoute(
      path: '/notifications',
      name: AppRouteNames.notifications,
      builder: (BuildContext context, GoRouterState state) =>
          const NotificationListPage(),
    ),
    GoRoute(
      path: '/loungeSearch',
      name: AppRouteNames.loungeSearch,
      builder: (BuildContext context, GoRouterState state) =>
          const LoungeSearchPage(),
    ),
    GoRoute(
      path: '/loungeCreate',
      name: AppRouteNames.loungeCreate,
      builder: (BuildContext context, GoRouterState state) =>
          const LoungeCreatePage(),
    ),

    GoRoute(
      path: '/terms',
      name: AppRouteNames.terms,
      builder: (BuildContext context, GoRouterState state) =>
      const TermsOfServicePage(),
    ),
    GoRoute(
      path: '/privacy',
      name: AppRouteNames.privacy,
      builder: (BuildContext context, GoRouterState state) =>
          const PrivacyPolicyPage(),
    ),
    GoRoute(
      path: '/signUpAgreement',
      name: AppRouteNames.signUpAgreement,
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpAgreementPage(),
    ),
    GoRoute(
      path: '/signUp',
      name: AppRouteNames.signUp,
      builder: (BuildContext context, GoRouterState state) =>
      const RegisterPage(),
    ),
    GoRoute(
      path: '/signUpSuccess',
      name: AppRouteNames.signUpSuccess,
      builder: (BuildContext context, GoRouterState state) =>
      const RegisterSuccessPage(),
    ),
    GoRoute(
      path: '/passwordReset',
      name: AppRouteNames.passwordReset,
      builder: (BuildContext context, GoRouterState state) =>
          const PasswordResetPage(),
    ),
    GoRoute(
      path: '/passwordResetCode',
      name: AppRouteNames.passwordResetCode,
      builder: (BuildContext context, GoRouterState state) =>
          PasswordResetCodePage(
        email: (state.extra as String?) ?? '',
      ),
    ),
    GoRoute(
      path: '/passwordResetNewPassword',
      name: AppRouteNames.passwordResetNewPassword,
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
      name: AppRouteNames.passwordResetSuccess,
      builder: (BuildContext context, GoRouterState state) =>
          const PasswordResetSuccessPage(),
    ),
  ],
);


