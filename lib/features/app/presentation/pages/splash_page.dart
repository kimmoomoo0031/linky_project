import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/theme_mode_provider.dart';

///TODO 後ほど全画面のコメントを細かく書くようにする

/// アプリ起動時に最初に表示されるスプラッシュ画面。
///
/// 背景色は #E6F7FF、中央に SVG ロゴとローディングインジケーターを表示します。
/// この画面の表示中にトークンチェックなどの初期化処理を行い、完了後にログイン画面
/// もしくはホーム画面へ遷移させる想定です。
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 初回フレーム描画後にチェック処理を開始する。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndNavigate();
    });
  }

  Future<void> _checkAuthAndNavigate() async {
    // 最後に保存されたテーマ（ライト/ダーク）を先に読み込み、以降の画面が“チラつき”なく表示されるようにする。
    await ref.read(themeModeProvider.notifier).load();

    // TODO: ここでトークンチェックや自動ログイン処理を行う。
    // 仮で 2.5 秒待ってからログイン画面へ遷移させる。
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    //ログイン画面へ遷移。
    context.goLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GradientText(
              '気になる話題から\nつながりがはじまる',
              gradient: AppColors.linky45degGradient,
              style: AppTextStyles.splashTitleTextStyle24,
            ),
            const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ],
        )
      ),
    );
  }
}


