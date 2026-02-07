import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';

/// ゲストユーザー向け：ログイン誘導 UI（埋め込み用）。
///
/// - Drawer の body など「画面の一部」として使う想定
class GuestGateView extends StatelessWidget {
  const GuestGateView({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          SvgPicture.asset(
            AppAssets.guestSignupLogoSvg,
            width: 200,
            height: 200,
            colorFilter: ColorFilter.mode(cs.onSurfaceVariant, BlendMode.srcIn),
          ),
          const SizedBox(height: 10),
          Text(
            'マイページの利用にはログインが必要です。\nアカウント登録を行ってください。',
            textAlign: TextAlign.center,
            style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 30),
          AuthActionButton(
              label: 'ログイン',
              onPressed: onLogin,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}


