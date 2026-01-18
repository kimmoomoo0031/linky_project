import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/utils/formatters.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_info_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_info_providers.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';

/// ラウンジ情報ページ（未実装の殻）。
///
/// - ラウンジ作成時に入力した「カバー画像/ラウンジ名/紹介」を表示する想定
class LoungeInfoPage extends ConsumerWidget {
  const LoungeInfoPage({super.key, required this.loungeId});

  final int loungeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final id = loungeId;
    final asyncInfo = ref.watch(loungeInfoControllerProvider(id));
    final loungeTitle = asyncInfo.valueOrNull?.title;

    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ラウンジ情報',
        showBackButton: true,
        onBackPressed: () {
          context.goLounge(id, tab: LoungeTab.home, loungeTitle: loungeTitle);
        },
      ),
      body: SafeArea(
        child: asyncInfo.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(
              'ラウンジ情報の取得に失敗しました。',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
          data: (data) => _LoungeInfoBody(data: data),
        ),
      ),
    );
  }
}

class _LoungeInfoBody extends StatelessWidget {
  const _LoungeInfoBody({required this.data});

  final LoungeInfoViewData data;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final metaLabelStyle = AppTextStyles.body14.copyWith(
      color: cs.onSurface,
    );
    final metaValueStyle = AppTextStyles.body14.copyWith(color: AppColors.primaryGray);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.body16Bold.copyWith(color: cs.onSurface),
          ),
          const SizedBox(height: 12),
          _CoverImage(url: data.coverImageUrl),
          const SizedBox(height: 16),
          Text(
            data.description,
            style: AppTextStyles.body14.copyWith(color: cs.onSurface),
          ),
          const SizedBox(height: 20),
          _MetaRow(
            label: '開設日',
            labelStyle: metaLabelStyle,
            valueWidget: LinkyDateText(
              data.createdAt,
              pattern: 'yyyy.MM.dd',
              style: metaValueStyle,
            ),
          ),
          const SizedBox(height: 12),
          _MetaRow(
            label: '投稿数',
            labelStyle: metaLabelStyle,
            valueWidget: LinkyNumberText(
              data.totalPostCount,
              style: metaValueStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.trim().isNotEmpty;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: hasUrl
            ? Image.network(url!, fit: BoxFit.cover)
            : SvgPicture.asset(
                AppAssets.loungeDefaultImgSvg,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.label,
    required this.valueWidget,
    required this.labelStyle,
  });

  final String label;
  final Widget valueWidget;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: labelStyle,
        ),
        const SizedBox(width: 8),
        Expanded(child: valueWidget),
      ],
    );
  }
}
