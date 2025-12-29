import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/constants/lounge_create_constants.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/core/widgets/linky_info_box.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_create_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/lounge_dialog_event_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_create_state.dart';

import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';

/// ラウンジ作成画面。
///
/// - 入力は StateNotifier で管理
/// - バリデーションエラーは TextField 直下に表示（共通デコレーション）
/// - 画像は「選択 → 1:1クロップ → サムネ生成 → 円形プレビュー」
class LoungeCreatePage extends ConsumerWidget {
  const LoungeCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final state = ref.watch(loungeCreateControllerProvider);
    final controller = ref.read(loungeCreateControllerProvider.notifier);

    // ダイアログ表示イベント（1回限り）
    ref.listen(loungeCreateDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;

      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
        svgAssetPath: switch (event.type) {
          LinkyDialogType.error => AppAssets.failXLogoSvg,
          LinkyDialogType.warning => AppAssets.warningLogoSvg,
          _ => AppAssets.editProfileSuccessSvg,
        },
      );
      ref.read(loungeCreateDialogEventProvider.notifier).state = null;

      // 成功時は前の画面へ戻す（仮）
      if (event.type == LinkyDialogType.info && context.mounted) {
        context.pop();
      }
    });

    return Scaffold(
      appBar: const LinkyAppBar(title: 'ラウンジ作成', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinkyInfoBox(text: AuthDialogMessages.makeLoungeDescription),
              const SizedBox(height: 16),
              Text(
                'カバー画像を追加（任意）',
                style: AppTextStyles.body14.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              _CoverImagePicker(
                thumbnailBytes: state.thumbnailBytes,
                onTap: controller.pickCoverImage,
                size: LoungeCreateConstants.coverImageSize,
              ),
              const SizedBox(height: 6),
              Text(
                '未設定の場合は、デフォルト画像が表示されます。',
                style: AppTextStyles.body12.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              if (state.coverImageError != null) ...[
                const SizedBox(height: 6),
                Text(
                  state.coverImageError!,
                  style: AppTextStyles.body12.copyWith(color: cs.error),
                ),
              ],

              const SizedBox(height: 20),

              AuthLabeledTextField(
                label: 'ラウンジ名',
                hintText: '日本生活',
                isRequired: true,
                requiredMark: SvgPicture.asset(
                  AppAssets.asteriskLogoSvg,
                  width: 8,
                  height: 8,
                ),
                errorText: state.nameError,
                onChanged: controller.onNameChanged,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              _RuleAndCounterRow(
                ruleText: LoungeCreateConstants.nameRuleText,
                counterText:
                    '${state.nameCount}/${LoungeCreateConstants.nameMaxLength}',
                isOver: state.isNameOverLimit,
              ),

              const SizedBox(height: 20),

              AuthLabeledTextField(
                label: 'ラウンジ紹介',
                hintText: '日本での生活を共有できる場所です',
                isRequired: true,
                requiredMark: SvgPicture.asset(
                  AppAssets.asteriskLogoSvg,
                  width: 8,
                  height: 8,
                ),
                errorText: state.descriptionError,
                onChanged: controller.onDescriptionChanged,
                textInputAction: TextInputAction.newline,
                minLines: 4,
                maxLines: 6,
              ),
              const SizedBox(height: 6),
              _RuleAndCounterRow(
                ruleText: LoungeCreateConstants.descriptionRuleText,
                counterText:
                    '${state.descriptionCount}/${LoungeCreateConstants.descriptionMaxLength}',
                isOver: state.isDescriptionOverLimit,
              ),

              const SizedBox(height: 32),

              AuthActionButton(
                label: '作成する',
                onPressed: state.isSubmitting ? null : controller.submit,
                backgroundColor: cs.primary,
                textColor: cs.onPrimary,
                style: AuthActionButtonStyle.filled,
                isLoading: state.isSubmitting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 画像ピッカー（円形プレビュー）。
class _CoverImagePicker extends StatelessWidget {
  const _CoverImagePicker({
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

/// ルール文言（左）とカウンター（右）を表示する行。
class _RuleAndCounterRow extends StatelessWidget {
  const _RuleAndCounterRow({
    required this.ruleText,
    required this.counterText,
    required this.isOver,
  });

  final String ruleText;
  final String counterText;
  final bool isOver;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            ruleText,
            style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
          ),
        ),
        Text(
          counterText,
          style: AppTextStyles.body12.copyWith(
            color: isOver ? cs.error : cs.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
