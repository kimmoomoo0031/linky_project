import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/post/domain/entities/post_detail.dart';

/// 投稿詳細上部に表示するメタ情報ヘッダー（タイトル/作成者/統計/日時）。
class PostDetailMetaHeader extends StatelessWidget {
  const PostDetailMetaHeader({
    super.key,
    required this.post,
  });

  final PostDetail post;

  static String _formatDateTime(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$y/$m/$d $hh:$mm';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body14.copyWith(color: cs.onSurface),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          post.authorNickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body12.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ),
                      if (!post.authorIsGuest) ...[
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
                  const SizedBox(height: 6),
                  Text(
                    '閲覧数 ${post.viewCount} | コメント ${post.commentCount}',
                    style: AppTextStyles.body12.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              _formatDateTime(post.createdAt),
              style: AppTextStyles.body12.copyWith(
                color: cs.onSurfaceVariant,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const LinkyDivider(height: 1, thickness: 1),
      ],
    );
  }
}


