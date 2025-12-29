import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// アプリ共通のシンプルなダイアログ。
///
/// [type] によって色味を少し変えて、
/// - info: 通常の案内
/// - warning: 注意
/// - error: エラー
/// のニュアンスを出す。
Future<void> showLinkyDialog({
  required BuildContext context,
  String? title,
  required String message,
  String closeText = 'とじる',
  LinkyDialogType type = LinkyDialogType.info,
  String? svgAssetPath,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return _LinkyDialogShell(
        title: title,
        message: message,
        type: type,
        svgAssetPath: svgAssetPath,
        actions: [
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                closeText,
                style: AppTextStyles.body16Bold.copyWith(
                  color: Theme.of(ctx).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

/// アプリ共通の「確認用」ダイアログ（キャンセル/実行の2ボタン）。
///
/// - 返り値: 「実行」を押したら true、それ以外は false
/// - confirmText は用途ごとに文言が変わるため必須にする（事故防止）
Future<bool> showLinkyConfirmDialog({
  required BuildContext context,
  String? title,
  required String message,
  required String confirmText,
  String cancelText = 'キャンセル',
  LinkyDialogType type = LinkyDialogType.warning,
  String? svgAssetPath,
  bool barrierDismissible = false,
  bool isDestructive = false,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) {
      return _LinkyDialogShell(
        title: title,
        message: message,
        type: type,
        svgAssetPath: svgAssetPath,
        isDestructive: isDestructive,
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: Text(
                    cancelText,
                    style: AppTextStyles.body16Bold.copyWith(
                      color: Theme.of(ctx).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(true),
                  child: Text(
                    confirmText,
                    style: AppTextStyles.body16Bold.copyWith(
                      color: isDestructive
                          ? Theme.of(ctx).colorScheme.onError
                          : Theme.of(ctx).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
  return result ?? false;
}

/// Linkyダイアログの共通レイアウト（外部公開しない）。
///
/// - showLinkyDialog / showLinkyConfirmDialog の両方でUIを再利用するため
/// - ボタン（actions）だけ差し替え可能にする
class _LinkyDialogShell extends StatelessWidget {
  const _LinkyDialogShell({
    required this.message,
    required this.type,
    required this.actions,
    this.title,
    this.svgAssetPath,
    this.isDestructive = false,
  });

  final String? title;
  final String message;
  final LinkyDialogType type;
  final String? svgAssetPath;
  final List<Widget> actions;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dialogTitle = title;
    final iconAssetPath = svgAssetPath;
    final Color borderColor;
    final Color textColor;

    switch (type) {
      case LinkyDialogType.warning:
        borderColor = cs.primary;
        textColor = cs.onSurfaceVariant;
        break;
      case LinkyDialogType.error:
        borderColor = cs.error;
        textColor = cs.onSurfaceVariant;
        break;
      case LinkyDialogType.info:
        borderColor = cs.primary;
        textColor = cs.onSurfaceVariant;
        break;
    }

    // 破壊的操作（例: ログアウト/削除）にしたい場合は confirm ボタンを赤にする
    final confirmBg = isDestructive ? cs.error : cs.primary;
    final confirmFg = isDestructive ? cs.onError : cs.onPrimary;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: borderColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: cs.surface,
                ),
              ),
              filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: confirmBg,
                  foregroundColor: confirmFg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconAssetPath != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: SvgPicture.asset(
                      iconAssetPath,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
                if (dialogTitle != null && dialogTitle.isNotEmpty) ...[
                  // タイトル
                  Text(
                    dialogTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading20.copyWith(
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                // 本文
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body14.copyWith(
                    color: textColor,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 24),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

