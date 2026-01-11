import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/app_strings.dart';
import 'package:linky_project_0318/core/constants/mypage_constants.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/enums/withdraw_reason.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/labeled_field.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/core/widgets/linky_info_box.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_input_decorations.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:linky_project_0318/features/user/presentation/providers/withdraw_providers.dart';
import 'package:linky_project_0318/features/user/presentation/states/withdraw_state.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';

/// 退会（アカウント削除）画面。
class WithdrawPage extends ConsumerWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ダイアログ表示イベント（1回限り）
    ref.listen(withdrawDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;
      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
        // svgAssetPath: switch (event.type) {
        //   LinkyDialogType.error => AppAssets.failXLogoSvg,
        //   LinkyDialogType.warning => AppAssets.warningLogoSvg,
        //   _ => AppAssets.editProfileSuccessSvg,
        // },
      );
      ref.read(withdrawDialogEventProvider.notifier).state = null;
    });

    return Scaffold(
      appBar: const LinkyAppBar(title: 'アカウントの削除', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              // 退会前の注意事項（説明文 + 注意ボックス）
              _WithdrawWarningSection(),
              SizedBox(height: 18),
              // 現在のパスワード入力（必須）
              _WithdrawPasswordSection(),
              SizedBox(height: 18),
              // 退会理由の選択（必須）
              _WithdrawReasonSection(),
              SizedBox(height: 36),
              // 退会アクション（確認ダイアログ → 退会処理 → 完了ダイアログ）
              _WithdrawActionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WithdrawWarningSection extends StatelessWidget {
  const _WithdrawWarningSection();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 6),
        Text(
          '退会前にご確認ください。',
          style: AppTextStyles.body16.copyWith(color: AppColors.emphasisRed),
        ),
        const SizedBox(height: 6),
        Text(
          WithdrawConstants.description,
          style: AppTextStyles.body12.copyWith(color: cs.onSurfaceVariant),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 18),
        const LinkyInfoBox(text: WithdrawConstants.infoBoxText),
      ],
    );
  }
}

class _WithdrawPasswordSection extends ConsumerWidget {
  const _WithdrawPasswordSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(withdrawControllerProvider);
    final controller = ref.read(withdrawControllerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthPasswordField(
          label: AppLabels.currentPassword,
          hintText: AppHints.currentPassword,
          isRequired: true,
          requiredMark: SvgPicture.asset(
            AppAssets.asteriskLogoSvg,
            width: 8,
            height: 8,
          ),
          errorText: state.currentPasswordError,
          onChanged: controller.onCurrentPasswordChanged,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

class _WithdrawReasonSection extends ConsumerWidget {
  const _WithdrawReasonSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(withdrawControllerProvider);
    final controller = ref.read(withdrawControllerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _WithdrawReasonField(
          value: state.reason,
          errorText: state.reasonError,
          onChanged: controller.onReasonChanged,
        ),
      ],
    );
  }
}

class _WithdrawActionSection extends ConsumerWidget {
  const _WithdrawActionSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final state = ref.watch(withdrawControllerProvider);
    final controller = ref.read(withdrawControllerProvider.notifier);
    return AuthActionButton(
      label: '退会する',
      onPressed: state.canSubmit
          ? () async {
              final ok = await showLinkyConfirmDialog(
                context: context,
                title: '退会確認',
                message: '取り消しできません。\n本当に退会しますか？',
                confirmText: '退会',
                type: LinkyDialogType.confirm,
                isDestructive: true,
              );
              if (!ok) return;

              final success = await controller.withdraw();
              if (!success) return;
              if (!context.mounted) return;

              // 完了ダイアログ → ボタン押下後に遷移
              await showLinkyDialog(
                context: context,
                message: WithdrawConstants.completedContext,
                closeText: 'ログイン画面へ',
                type: LinkyDialogType.info,
                svgAssetPath: AppAssets.linkyLogoSvg,
              );
              if (!context.mounted) return;
              context.goWithdrawCompleted();
            }
          : null,
      backgroundColor: cs.error,
      textColor: cs.onError,
      style: AuthActionButtonStyle.filled,
      isLoading: state.isSubmitting,
    );
  }
}

class _WithdrawReasonField extends StatelessWidget {
  const _WithdrawReasonField({
    required this.value,
    required this.onChanged,
    required this.errorText,
  });

  final WithdrawReason? value;
  final ValueChanged<WithdrawReason?> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return LabeledField(
      label: AppLabels.withdrawReason,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      labelStyle: AppTextStyles.body14.copyWith(color: cs.onSurfaceVariant),
      child: DropdownButtonFormField2<WithdrawReason>(
        value: value,
        isExpanded: true,
        buttonStyleData: const ButtonStyleData(padding: EdgeInsets.zero),
        decoration: AuthInputDecorations.textField(
          context: context,
          errorText: errorText,
        ).copyWith(contentPadding: EdgeInsets.zero),
        hint: Text(
          AppLabels.withdrawReason,
          style: AppTextStyles.body12.copyWith(color: cs.outlineVariant),
        ),
        dropdownStyleData: const DropdownStyleData(offset: Offset(0, 0)),
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset(
            AppAssets.arrowDownLogoSvg,
            width: WithdrawConstants.arrowIconWidthSize,
            height: WithdrawConstants.arrowIconHeightSize,
          ),
          openMenuIcon: SvgPicture.asset(
            AppAssets.arrowUpLogoSvg,
            width: WithdrawConstants.arrowIconWidthSize,
            height: WithdrawConstants.arrowIconHeightSize,
          ),
          iconSize: 30,
        ),
        items: WithdrawReason.values
            .map(
              (r) => DropdownMenuItem<WithdrawReason>(
                value: r,
                child: Text(
                  r.label(),
                  style: AppTextStyles.body12.copyWith(color: cs.onSurface),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
