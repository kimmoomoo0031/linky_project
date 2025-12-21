import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';

/// アプリ全体の Theme 定義（ライト/ダーク）。
///
/// 色は `ColorScheme` を正にして、各画面は `Theme.of(context).colorScheme`
/// を参照する方針に寄せる（色の直書きを減らす）。
class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? const Color(0xFF4DA3FF) : const Color(0xFF2F8CFF);
    final seed = primary;
    final scaffoldBg =
        isDark ? const Color(0xFF070D19) : const Color(0xFFF6F8FB);
    final surfaceBase =
        isDark ? const Color(0xFF0B1220) : const Color(0xFFF8FAFC);
    final cardSurface = isDark ? const Color(0xFF0F172A) : AppColors.primaryWhite;
    final inputFill = cardSurface;

    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    ).copyWith(
      primary: primary,
      onPrimary: AppColors.primaryWhite,
      error: AppColors.error,
      onError: AppColors.primaryWhite,

      surface: surfaceBase,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
    );

    return base.copyWith(
      // 背景（最下層）と surface（カード/リスト等の基準面）をわずかに分離し、
      // レイヤー表現（カード/ダイアログ/ボトムシート）で “一段” 作れるようにする。
      scaffoldBackgroundColor: scaffoldBg,
      textTheme: GoogleFonts.openSansTextTheme(base.textTheme).copyWith(
        // 最小限の意味付け（過度に作り込まず “チューニングポイント” だけ用意する）
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          height: 1.6,
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          height: 1.4,
        ),
        labelLarge: base.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      cardTheme: CardThemeData(
        color: cardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: scheme.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.onSurface.withAlpha(31), // 0.12 * 255 ≒ 31
          disabledForegroundColor: scheme.onSurface.withAlpha(97), // 0.38 * 255 ≒ 97
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.onSurface.withAlpha(31), // 0.12 * 255 ≒ 31
          disabledForegroundColor: scheme.onSurface.withAlpha(97), // 0.38 * 255 ≒ 97
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          disabledForegroundColor: scheme.onSurface.withAlpha(97), // 0.38 * 255 ≒ 97
          side: BorderSide(color: scheme.outlineVariant),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      iconTheme: IconThemeData(
        color: scheme.onSurfaceVariant,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
      ),
    );
  }
}


