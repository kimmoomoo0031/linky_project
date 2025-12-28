import 'package:flutter/material.dart';

/// アプリ全体で使用するカラー定義。
class AppColors {
  /// インスタンス生成を禁止するためのコンストラクタ。
  const AppColors._();

  /// ブランド／アクション用のメインブルー (#057CF2)。
  static const Color primaryActionBlue = Color(0xFF057CF2);

  /// グレーテキストやアイコンに使用するグレー (#8E8E93)。
  static const Color primaryGray = Color(0xFF8E8E93);

  /// バリデーションエラー文字色 (#E53935)。
  static const Color error = Color(0xFFE53935);

  /// ベスト投稿ランキング3 (#53935)。
  static const Color emphasisRed = Color(0xFFE53935);

  /// ホワイト背景 (#FFFFFF)。
  static const Color primaryWhite = Color(0xFFFFFFFF);

  /// ライトモードベストロゴ (#9A825)。
  static const Color lightModelBestLogo = Color(0xFFF9A825);

  /// 左下から右上（45度方向）に向かって #4A90E2 から #50E3C2 に変化するグラデーション。
  static const LinearGradient linky45degGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: <Color>[Color(0xFF4A90E2), Color(0xFF50E3C2)],
  );
}