import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/utils/image_url_builder.dart';

/// ラウンジ一覧などで使う共通カード（画像 + タイトル）。
///
/// 画面側で毎回「プレースホルダ画像 + タイトル」を組み立てないために、
/// このWidget側に “標準サムネ” の責務を寄せる。
///
/// - [thumbnail] を渡したらそれを優先して表示
/// - [thumbnailUrl] があればネットワーク画像（S3等）を表示
/// - どちらも無ければ標準アイコン（asset）を表示
class LoungeCard extends StatelessWidget {
  const LoungeCard({
    super.key,
    required this.title,
    this.thumbnail,
    this.thumbnailUrl,
    this.fallbackThumbnail,
    this.onTap,
    this.onLongPress,
  }) : assert(
         !(thumbnail != null && thumbnailUrl != null),
         'thumbnail と thumbnailUrl は同時に指定できません。',
       );

  const LoungeCard.basic({
    super.key,
    required this.title,
    this.fallbackThumbnail,
    this.onTap,
    this.onLongPress,
  }) : thumbnail = null,
       thumbnailUrl = null;

  final String title;
  final Widget? thumbnail;

  /// 将来的にS3などのURLでサムネを表示するためのURL。
  ///
  /// - `.svg` の場合は `SvgPicture.network`
  /// - それ以外は `Image.network`
  final String? thumbnailUrl;

  /// 画像の取得に失敗した場合や未設定の場合に表示するフォールバック。
  ///
  /// 例: `SvgPicture.asset(AppAssets.loungeIconLogoSvg)`
  final Widget? fallbackThumbnail;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  // タイルが小さい場合でも overflow しないように、タイトル領域の高さを確保する。
  static const double _titleSpacing = 4;
  static const double _fallbackIconSize = 100;

  Widget _buildFixedFallback(Widget fallback) {
    return Center(
      child: SizedBox(
        width: _fallbackIconSize,
        height: _fallbackIconSize,
        child: fallback,
      ),
    );
  }

  /// 画像の縦横比がバラバラでも、見た目のサイズ感が揃うようにする。
  ///
  /// - ラスタ画像URL: `BoxFit.cover`（枠いっぱい、必要ならトリミング）
  /// - SVG/プレースホルダ: `BoxFit.contain`（見切れなし）
  Widget _buildThumbnailFitted(BuildContext context) {
    final fallbackLogo =
        fallbackThumbnail ?? SvgPicture.asset(AppAssets.linkyLogoSvg);
    // 呼び出し側がWidgetを直接渡す場合は「見切れなし」で収める（安全側）
    if (thumbnail != null) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: FittedBox(fit: BoxFit.contain, child: thumbnail!),
      );
    }

    final url = thumbnailUrl;
    if (url != null && url.isNotEmpty) {
      final lower = url.toLowerCase();
      if (lower.endsWith('.svg')) {
        return SvgPicture.network(
          url,
          fit: BoxFit.contain,
          placeholderBuilder: (context) => _buildFixedFallback(fallbackLogo),
        );
      }

      // 写真系は cover で “枠いっぱいに揃える”
      return LayoutBuilder(
        builder: (context, constraints) {
          // 1) いま画面で表示する「フレームの実サイズ(px)」を算出
          final dpr = MediaQuery.of(context).devicePixelRatio;
          final logical = constraints.biggest.shortestSide; // 正方形想定
          final neededPx = (logical * dpr).ceil().clamp(1, 4096);

          // 2) CDNキャッシュ効率を考えて、固定バケットに丸める（例: 128/256/512...）
          final bucketPx = ImageUrlBuilder.bucketSquareSizePx(neededPx);

          // 3) 原本URLに w/h/fit を付けてリサイズ版を要求
          final sizedUrl = ImageUrlBuilder.withSquareCropParams(
            url,
            sizePx: bucketPx,
          );

          return SizedBox.expand(
            child: Image.network(
              sizedUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildFixedFallback(fallbackLogo),
            ),
          );
        },
      );
    }

    // デフォルト（画像未登録）
    return _buildFixedFallback(fallbackLogo);
  }

  @override
  Widget build(BuildContext context) {
    final loungeCardBorderSize = BorderRadius.circular(16);
    final cs = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        onLongPress: onLongPress,
        child: LayoutBuilder(
          builder: (context, constraints) {
            const desiredTitleHeight = 38.0; // 2行分の目安
            final h = constraints.maxHeight;
            final w = constraints.maxWidth;

            // タイトル領域（spacing含む）を確保した残りでサムネを作る（可能な限り正方形）
            final reserved = desiredTitleHeight + _titleSpacing;
            final thumbSide = (h - reserved).clamp(0.0, w);
            final titleHeight = (h - thumbSide).clamp(0.0, h);

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: thumbSide,
                  child: Center(
                    child: SizedBox(
                      width: thumbSide,
                      height: thumbSide,
                      child: ClipRRect(
                        borderRadius: loungeCardBorderSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: cs.outlineVariant),
                            color: cs.surface,
                            borderRadius: loungeCardBorderSize,
                          ),
                          child: SizedBox.expand(
                            child: _buildThumbnailFitted(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: titleHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: _titleSpacing),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body12.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
