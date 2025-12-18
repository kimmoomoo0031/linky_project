import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/auth_providers.dart';
import 'package:linky_project_0318/features/home/home_providers.dart';

/// スライドドロワーのメニュー画面。
class HomeMenuPage extends ConsumerWidget {
  const HomeMenuPage({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHome = ref.watch(homeControllerProvider);
    final me = asyncHome.valueOrNull?.me;

    void closeAndPush(String path) {
      onClose();
      Future.microtask(() {
        if (!context.mounted) return;
        context.push(path);
      });
    }

    // ZoomDrawer の menuScreen は Scaffold/Material の外側で描画されることがあるため、
    // ListTile が要求する Material 祖先をここで保証する。
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 16),
              SvgPicture.asset(AppAssets.linkyLogoSvg, width: 20, height: 20),
              const SizedBox(width: 6),
              Text('Linky',
                  style: AppTextStyles.body16Bold
                      .copyWith(color: AppColors.primaryActionBlue)),
              const Spacer(),
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close, color: AppColors.primaryGray),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),
          _UserHeader(
            nickname: me?.nickname ?? '—',
            email: me?.email ?? '',
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _MenuTile(
                  title: '自分の投稿',
                  onTap: () => closeAndPush('/myPosts'),
                ),
                _MenuTile(
                  title: 'プロフィール編集',
                  onTap: () => closeAndPush('/profileEdit'),
                ),
                _MenuTile(title: '通知設定', onTap: () {}),
                _MenuTile(title: 'ラウンジ申請', onTap: () {}),
                _MenuTile(
                  title: 'ログアウト',
                  onTap: () async {
                    onClose();
                    await ref.read(authRepositoryProvider).logout();
                    if (!context.mounted) return;
                    context.go('/login');
                  },
                ),
                const SizedBox(height: 8),
                _MenuTile(
                  title: '退会する',
                  titleColor: AppColors.error,
                  onTap: () {},
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({required this.nickname, required this.email});

  final String nickname;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundBlue,
        border: Border.all(color: AppColors.outlineGray),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            nickname,
            style:
                AppTextStyles.body16Bold.copyWith(color: AppColors.primaryBlack),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: AppTextStyles.body12.copyWith(color: AppColors.primaryGray),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.title,
    required this.onTap,
    this.titleColor,
  });

  final String title;
  final VoidCallback onTap;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        border: Border.all(color: AppColors.outlineGray),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        dense: true,
        title: Text(
          title,
          style: AppTextStyles.body14.copyWith(
            color: titleColor ?? AppColors.primaryGray,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.primaryGray),
        onTap: onTap,
      ),
    );
  }
}


