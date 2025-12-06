import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// Linky 共通ヘッダー。
/// 画面ごとにタイトルだけ変えて再利用することを想定した AppBar です。
class LinkyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LinkyAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
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

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.backgroundBlue,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton && canPop
          ? IconButton(
              onPressed: onBackPressed ?? () =>  context.pop(),
              icon: SvgPicture.asset(
                'assets/images/common/back_logo.svg',
                width: 20,
                height: 20,
              ),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.body16Bold.copyWith(color: AppColors.primaryGray),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.outlineGray.withOpacity(0.3),
        ),
      ),
    );
  }
}
