import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:linky_project_0318/core/router/app_router.dart';
import 'package:linky_project_0318/core/debug/riverpod_debug_observer.dart';
import 'package:linky_project_0318/core/theme/app_theme.dart';
import 'package:linky_project_0318/core/storage/shared_prefs_provider.dart';
import 'package:linky_project_0318/core/theme/theme_mode_provider.dart';

/// `--dart-define=ENABLE_STATE_OBSERVER=true` を付けた時だけ有効になる（デバッグ用）。
const bool _enableStateObserver =
    bool.fromEnvironment('ENABLE_STATE_OBSERVER', defaultValue: false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
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
    return const _AppRoot();
  }
}

class _AppRoot extends ConsumerWidget {
  const _AppRoot();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: mode,
      routerConfig: appRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
    );
  }
}