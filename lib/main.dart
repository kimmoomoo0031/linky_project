import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/router/app_router.dart';
import 'package:linky_project_0318/core/debug/riverpod_debug_observer.dart';
import 'package:linky_project_0318/core/theme/app_theme.dart';

/// `--dart-define=ENABLE_STATE_OBSERVER=true` を付けた時だけ有効になる（デバッグ用）。
const bool _enableStateObserver =
    bool.fromEnvironment('ENABLE_STATE_OBSERVER', defaultValue: false);

void main() {
  runApp(
    ProviderScope(
      observers: kDebugMode && _enableStateObserver
          ? const [RiverpodDebugObserver()]
          : const [],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}