import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';

/// 画像ピッカー（円形プレビュー）。
class CoverImagePicker extends StatelessWidget {
  const CoverImagePicker({
    super.key,
    required this.thumbnailBytes,
    required this.onTap,
    required this.size,
  });

  final Uint8List? thumbnailBytes;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: cs.outlineVariant),
              color: cs.surface,
            ),
            child: thumbnailBytes == null
                ? SvgPicture.asset(
                    AppAssets.selectImageLogoSvg,
                    width: size,
                    height: size,
                  )
                : ClipOval(
                    child: Image.memory(
                      thumbnailBytes!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

