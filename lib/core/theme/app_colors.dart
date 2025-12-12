import 'package:flutter/material.dart';

/// アプリ全体で使用するカラー定義。
class AppColors {
  /// インスタンス生成を禁止するためのコンストラクタ。
  const AppColors._();

  /// スプラッシュ画面の背景色 (#E6F7FF)。
  static const Color splashBackground = Color(0xFFE6F7FF);

  /// 画面全体の背景などに使用する淡いブルー (#E6F7FF)。
  static const Color backgroundBlue = Color(0xFFE6F7FF);

  /// ブランド／アクション用のメインブルー (#057CF2)。
  static const Color primaryActionBlue = Color(0xFF057CF2);

  /// グレーテキストやアイコンに使用するグレー (#8E8E93)。
  static const Color primaryGray = Color(0xFF8E8E93);

  /// ブラックテキストに使用する (#000000)。
  static const Color primaryBlack = Color(0xFF000000);

  /// ホワイト背景 (#FFFFFF)。
  static const Color primaryWhite = Color(0xFFFFFFFF);

  /// Lineでログインボタン (#06C755)。
  static const Color lineButton = Color(0xFF06C755);

  /// ログインボタンカラー (#4A90E2)。
  static const Color loginButton = Color(0xFF4A90E2);

  /// バリデーションエラー文字色 (#E53935)。
  static const Color error = Color(0xFFE53935);

  /// 入力欄フォーカス時のボーダーカラー (#8E8E93)。
  static const Color inputBorderFocus = Color(0xFF8E8E93);

  /// アウトラインや仕切り線に使用するグレー (#BCBCBC)。
  static const Color outlineGray = Color(0xFFBCBCBC);

  /// ダイアログ透明背景 (#000000)。
  static const Color dialogBackground = Color(0x00000000);

  /// インディケーターが回る時の背景（0x42000000）
  static const Color indicatorBackground = Color(0x42000000);

  /// 左下から右上（45度方向）に向かって #4A90E2 から #50E3C2 に変化するグラデーション。
  static const LinearGradient linky45degGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: <Color>[Color(0xFF4A90E2), Color(0xFF50E3C2)],
  );
}