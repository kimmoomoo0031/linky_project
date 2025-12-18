import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'home_main_page.dart';
import 'home_menu_page.dart';

/// ホーム画面（メイン + スライドドロワー）。
///
/// 2枚目のような「メインがスライドしてメニューが見える」表現は
/// `flutter_zoom_drawer` を利用する。
class HomeShellPage extends ConsumerStatefulWidget {
  const HomeShellPage({super.key});

  @override
  ConsumerState<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends ConsumerState<HomeShellPage> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: HomeMenuPage(
        onClose: () => _drawerController.toggle?.call(),
      ),
      mainScreen: HomeMainPage(
        onPressedMenu: () => _drawerController.toggle?.call(),
      ),
      borderRadius: 18,
      angle: 0,
      slideWidth: MediaQuery.sizeOf(context).width * 0.78,
      menuBackgroundColor: Theme.of(context).colorScheme.surface,
      mainScreenTapClose: true,
    );
  }
}


