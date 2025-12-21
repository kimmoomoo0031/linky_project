import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 認証画面で使用するアクションボタンのスタイル種別。
enum AuthActionButtonStyle {
  /// 塗りつぶしボタン（ElevatedButton 風）。
  filled,

  /// アウトラインボタン（OutlinedButton 風）。
  outlined,
}

/// 認証画面（ログイン/新規登録 など）で使用する共通アクションボタン。
/// LINE ログイン / Google ログイン / ゲストログイン など、
/// デザインは同じで色やアイコンだけが異なるボタンをこのコンポーネントで統一します。
class AuthActionButton extends StatelessWidget {
  const AuthActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.icon,
    this.style = AuthActionButtonStyle.filled,
    this.isLoading = false,
  });

  /// ボタンに表示するテキスト。
  final String label;

  /// タップ時に呼ばれるコールバック。
  final VoidCallback? onPressed;

  /// 塗りつぶし色。未指定の場合はスタイルに応じて自動決定します。
  final Color? backgroundColor;

  /// テキストカラー。未指定の場合はスタイルに応じて白 or ブラックを利用します。
  final Color? textColor;

  /// 枠線の色（Outlined ボタン向け）。
  final Color? borderColor;

  /// 左側に表示するアイコン（任意）。SVG アイコンなどを渡せます。
  final Widget? icon;

  /// ボタンの見た目スタイル（塗りつぶし / アウトライン）。
  final AuthActionButtonStyle style;

  /// ローディング中かどうか。true の場合はタップ不可 & インジケーターを表示します。
  final bool isLoading;

  bool get _isFilled => style == AuthActionButtonStyle.filled;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final resolvedTextColor =
        textColor ?? (_isFilled ? cs.onPrimary : cs.onSurface);
    final resolvedBackgroundColor =
        backgroundColor ?? (_isFilled ? cs.primary : cs.surface);
    final resolvedBorderColor = borderColor ?? cs.outlineVariant;
    final Widget child;

    // ローディング中は中央にインジケーターのみ表示。
    // それ以外のときは「テキストは中央固定・アイコンは左端固定」にしたいので Stack を利用する。
    if (isLoading) {
      child = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(resolvedTextColor),
        ),
      );
    } else {
      child = Stack(
        alignment: Alignment.center,
        children: [
          if (icon != null)
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
          Center(
            child: Text(
              label,
              style: AppTextStyles.body16Bold.copyWith(color: resolvedTextColor),
            ),
          ),
        ],
      );
    }

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: _isFilled
          ? BorderSide.none
          : BorderSide(
              color: resolvedBorderColor,
            ),
    );

    final effectiveOnPressed = isLoading ? null : onPressed;

    if (_isFilled) {
      return SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: resolvedBackgroundColor,
            shape: shape,
            elevation: 0,
          ),
          child: child,
        ),
      );
    } else {
      return SizedBox(
        height: 48,
        child: OutlinedButton(
          onPressed: effectiveOnPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: resolvedBackgroundColor,
            side: BorderSide(color: resolvedBorderColor),
            shape: shape,
          ),
          child: child,
        ),
      );
    }
  }
}

