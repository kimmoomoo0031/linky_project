import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/lounge_constants.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';

/// 投稿一覧の1行表示（ラウンジメイン/自分の投稿などで共通利用）。
///
/// デザイン：
/// - Column の中に Row を2段
///   - 1段目：画像アイコン（任意） + ★（任意） + タイトル + 右側日時
///   - 2段目：ニックネーム(+認証) + 右寄せで閲覧数/いいね
class PostListItem extends StatelessWidget {
  const PostListItem({
    super.key,
    required this.post,
    this.showTopDivider = false,
    this.showBottomDivider = true,
    required this.onTap,
  });

  final MyPost post;
  final bool showTopDivider;
  final bool showBottomDivider;
  final VoidCallback onTap;

  ///ベスト投稿基準を満たしたか確認
  bool get _isPopular => post.likeCount >= LoungeConstants.popularStarMinLikeCount;


  /// 右側の表示：
  /// - 今日の投稿: HH:mm
  /// - 今日以外: yyyy/MM/dd
  static String _formatRightTime(DateTime dt) {
    final now = DateTime.now();
    final isToday =
        now.year == dt.year && now.month == dt.month && now.day == dt.day;

    if (isToday) {
      final hh = dt.hour.toString().padLeft(2, '0');
      final mm = dt.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y/$m/$d';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        if (showTopDivider) const LinkyDivider(height: 1, thickness: 1),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1段目：画像（任意） + タイトル + 右側日時
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (post.hasImage) ...[
                      SvgPicture.asset(
                        AppAssets.imageLogoSvg,
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                          cs.onSurfaceVariant,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    if (_isPopular) ...[
                      SvgPicture.asset(
                        AppAssets.bestLogoSvg,
                        width: 16,
                        height: 16,
                        colorFilter: isLight
                            ? const ColorFilter.mode(
                                AppColors.lightModelBestLogo,
                                BlendMode.srcIn,
                              )
                            : null, // ダークモードは元SVG色
                      ),
                      const SizedBox(width: 6),
                    ],
                    Expanded(
                      child: Text(
                        post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body14.copyWith(
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // 2段目：ニックネーム + 右寄せで閲覧数/いいね
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            post.nickname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.body12.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ),
                        if (!post.isGuest) ...[
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            AppAssets.userCheckLogoSvg,
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                              cs.onSurfaceVariant,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '閲覧数 ${post.viewCount} | いいね ${post.likeCount}',
                      style: AppTextStyles.body12.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 70,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _formatRightTime(post.createdAt),
                          style: AppTextStyles.body12.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (showBottomDivider) const LinkyDivider(height: 1, thickness: 1),
      ],
    );
  }
}


