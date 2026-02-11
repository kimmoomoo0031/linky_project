import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/post/enums/reaction_type.dart';

/// 投稿詳細の「いいね / よくないね」リアクション行。
class ReactionCountButton extends StatelessWidget {
  const ReactionCountButton({
    super.key,
    required this.likeCount,
    required this.dislikeCount,
    required this.myReaction,
    required this.disabled,
    required this.onLike,
    required this.onDislike,
  });

  final int likeCount;
  final int dislikeCount;
  final ReactionType myReaction;
  final bool disabled;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ReactionChip(
            iconAsset: AppAssets.bestLogoSvg,
            count: likeCount,
            selected: myReaction == ReactionType.like,
            disabled: disabled || myReaction != ReactionType.none,
            onTap: onLike,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ReactionChip(
            iconAsset: AppAssets.writePostBadLogoSvg,
            count: dislikeCount,
            selected: myReaction == ReactionType.dislike,
            disabled: disabled || myReaction != ReactionType.none,
            onTap: onDislike,
          ),
        ),
      ],
    );
  }
}

class _ReactionChip extends StatelessWidget {
  const _ReactionChip({
    required this.iconAsset,
    required this.count,
    required this.onTap,
    required this.selected,
    required this.disabled,
  });

  final String iconAsset;
  final int count;
  final VoidCallback onTap;
  final bool selected;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final border = selected ? cs.primary : cs.outlineVariant;
    final fg = selected ? cs.primary : cs.onSurfaceVariant;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(10),
          color: cs.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(fg, BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Text(
              count.toString(),
              style: AppTextStyles.body14.copyWith(color: fg),
            ),
          ],
        ),
      ),
    );
  }
}



