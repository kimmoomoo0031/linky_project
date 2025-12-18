import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/widgets/gradient_text.dart';
import '../../../../core/theme/app_typography.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';

///TODO 後ほど全画面のコメントを細かく書くようにする

/// アプリ起動時に最初に表示されるスプラッシュ画面。
///
/// 背景色は #E6F7FF、中央に SVG ロゴとローディングインジケーターを表示します。
/// この画面の表示中にトークンチェックなどの初期化処理を行い、完了後にログイン画面
/// もしくはホーム画面へ遷移させる想定です。
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 初回フレーム描画後にチェック処理を開始する。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndNavigate();
    });
  }

  Future<void> _checkAuthAndNavigate() async {
    // TODO: ここでトークンチェックや自動ログイン処理を行う。
    // 仮で 2.5 秒待ってからログイン画面へ遷移させる。
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    //ログイン画面へ遷移。
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GradientText(
              'つながる・見つける・楽しむ',
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


