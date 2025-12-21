import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';

class HomeMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeMainAppBar({super.key, required this.onPressedMenu});

  final VoidCallback onPressedMenu;

  @override
  // このウィジェットが望むサイズ（特に高さ）を Scaffold に伝えるための値。
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        // テーマに追従（ダーク時に白固定にならないようにする）
        backgroundColor: cs.surface,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // TODO: 通知画面
          },
          icon: SvgPicture.asset(
            AppAssets.bellLogoSvg,
            width: 25,
            height: 25,
            colorFilter: ColorFilter.mode(cs.onSurfaceVariant, BlendMode.srcIn),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.linkyLogoSvg, width: 40, height: 40),
          ],
        ),
        actions: [
          IconButton(
            onPressed: onPressedMenu,
            icon: SvgPicture.asset(
              AppAssets.mainScreenListLogoSvg,
              width: 35,
              height: 35,
              colorFilter:
                  ColorFilter.mode(cs.onSurfaceVariant, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}


