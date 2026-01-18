import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 画面ごとにタイトルを変えて使う共通 AppBar。
class LinkyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LinkyAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showClearNotificationButton = false,
    this.onClearNotificationPressed,
    this.onBackPressed,
    this.actions,
  });

  /// 中央に表示するタイトル文字列。
  final String title;

  /// 戻るボタンを表示するかどうか。
  final bool showBackButton;

  /// 戻るボタンタップ時のハンドラ。
  /// 未指定の場合は `Navigator.of(context).pop()` を実行します。
  final VoidCallback? onBackPressed;

  /// 右側に表示するアクションボタン群。
  final List<Widget>? actions;

  /// 通知一覧を空っぽにするかどうか。
  final bool showClearNotificationButton;
  final VoidCallback? onClearNotificationPressed;

  List<Widget>? _notificationBuildActions() {
    final list = <Widget>[
      ...?actions,
      if (showClearNotificationButton)
        IconButton(
          onPressed: onClearNotificationPressed,
          icon: SvgPicture.asset(
            AppAssets.clearNotificationLogoSvg,
            width: 30,
            height: 30,
          ),
        ),
    ];

    return list.isEmpty ? null : list;
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();
    final cs = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackButton && (canPop || onBackPressed != null)
          ? IconButton(
              onPressed: onBackPressed ?? () {
                if (context.canPop()) context.pop();
              },
              icon: SvgPicture.asset(
                AppAssets.backLogoSvg,
                width: 20,
                height: 20,
              ),
            )
          : null,
      title: Text(
        title,
        // ライトモードのみ、指定色へ変更する（ダークは既存のまま）
        style: AppTextStyles.body16Bold.copyWith(
          color: isLight ? AppColors.primaryGray : cs.onSurface,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: _notificationBuildActions(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: cs.outlineVariant),
      ),
    );
  }
}
