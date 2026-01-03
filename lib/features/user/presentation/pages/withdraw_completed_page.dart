import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/withdraw_constants.dart';

/// 退会完了後の遷移用画面（ロゴ + インディケータ → ログインへ）。
///
/// - “退会が完了しました” を出しつつ、短い演出で自然にログイン画面へ遷移させる
class WithdrawCompletedPage extends StatefulWidget {
  const WithdrawCompletedPage({super.key});

  @override
  State<WithdrawCompletedPage> createState() => _WithdrawCompletedPageState();
}

class _WithdrawCompletedPageState extends State<WithdrawCompletedPage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // フェード/スケールのトリガー
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _visible = true);
    });

    // 1.2秒後にログインへ
    Future<void>.delayed(
      const Duration(milliseconds: WithdrawConstants.completedDelayMs),
      () {
      if (!mounted) return;
      context.go('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: const Duration(milliseconds: WithdrawConstants.completedAnimMs),
            curve: Curves.easeOut,
            child: AnimatedScale(
              scale: _visible ? 1.0 : WithdrawConstants.completedBeginScale,
              duration: const Duration(milliseconds: WithdrawConstants.completedAnimMs),
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.linkyLogoSvg, width: 70, height: 70),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(cs.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


