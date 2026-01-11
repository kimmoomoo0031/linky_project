import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/dialog_messages.dart';
import 'package:linky_project_0318/core/constants/app_strings.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';
import 'package:linky_project_0318/features/user/user_exports.dart';
import 'package:linky_project_0318/features/user/presentation/controllers/profile_edit_controller.dart';
import 'package:linky_project_0318/features/user/presentation/states/profile_edit_state.dart';

/// プロフィール編集画面（モック）。
class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _emailCtrl = TextEditingController();
  final _nicknameCtrl = TextEditingController();
  bool _didInitText = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nicknameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileEditControllerProvider);
    final controller = ref.read(profileEditControllerProvider.notifier);

    // 1回限りのダイアログイベント
    ref.listen(profileEditDialogEventProvider, (previous, next) async {
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
      // 成功ダイアログ表示後は画面を戻す。
      if (!context.mounted) return;

      ref.read(profileEditDialogEventProvider.notifier).state = null;

      if (event.type == LinkyDialogType.info &&
          event.message == CommonDialogMessages.profileUpdated) {
        Navigator.of(context).pop();
      }
    });

    // 初回ロード完了後に TextEditingController へ反映（カーソルが飛ばないように1回だけ）。
    if (!state.isLoading && !_didInitText) {
      _didInitText = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _emailCtrl.text = state.email;
        _nicknameCtrl.text = state.nickname;
      });
    }

    return Scaffold(
      appBar: const LinkyAppBar(title: 'プロフィール編集', showBackButton: true),
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _ProfileEditScrollContent(
                state: state,
                controller: controller,
                emailController: _emailCtrl,
                nicknameController: _nicknameCtrl,
                onPressedHelp: () {
                  showLinkyDialog(
                    context: context,
                    title: AuthDialogMessages.editProfileInputRuleTitle,
                    message: AuthDialogMessages.editProfileInputRuleBody,
                    type: LinkyDialogType.info,
                  );
                },
                onPressedSubmit: controller.save,
              ),
      ),
    );
  }
}

/// プロフィール編集画面のスクロール領域（本文）をまとめるクラス。
class _ProfileEditScrollContent extends StatelessWidget {
  const _ProfileEditScrollContent({
    required this.state,
    required this.controller,
    required this.emailController,
    required this.nicknameController,
    required this.onPressedHelp,
    required this.onPressedSubmit,
  });

  final ProfileEditState state;
  final ProfileEditController controller;
  final TextEditingController emailController;
  final TextEditingController nicknameController;
  final VoidCallback onPressedHelp;
  final VoidCallback onPressedSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HelpIconButton(onPressed: onPressedHelp),
          _EmailField(
            controller: emailController,
            onChanged: controller.onEmailChanged,
            errorText: state.emailError,
          ),
          const SizedBox(height: 16),
          _NicknameField(
            controller: nicknameController,
            onChanged: controller.onNicknameChanged,
            errorText: state.nicknameError,
          ),
          const SizedBox(height: 16),
          _CurrentPasswordField(
            onChanged: controller.onCurrentPasswordChanged,
            errorText: state.currentPasswordError,
          ),
          const SizedBox(height: 16),
          _PasswordField(
            onChanged: controller.onPasswordChanged,
            errorText: state.passwordError,
          ),
          const SizedBox(height: 16),
          _PasswordConfirmField(
            onChanged: controller.onPasswordConfirmChanged,
            errorText: state.passwordConfirmError,
          ),
          const SizedBox(height: 32),
          _SubmitButton(
            isLoading: state.isSaving,
            onPressed: state.isSaving ? null : onPressedSubmit,
          ),
        ],
      ),
    );
  }
}

/// 入力ルールなどのヘルプダイアログを開くアイコンボタンを表示するクラス。
class _HelpIconButton extends StatelessWidget {
  const _HelpIconButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          AppAssets.helpCircleLogoSvg,
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}

/// メールアドレス入力欄（ラベル + 必須 + TextField）を表示するセクション用クラス。
class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: AppLabels.email,
      hintText: '',
      controller: controller,
      enabled: false,
      isRequired: true,
    );
  }
}

/// ニックネーム入力欄（ラベル + 必須 + TextField）を表示するセクション用クラス。
class _NicknameField extends StatelessWidget {
  const _NicknameField({
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthLabeledTextField(
      label: AppLabels.nickname,
      hintText: AppHints.nickname,
      controller: controller,
      errorText: errorText,
      onChanged: onChanged,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// 現在のパスワード入力欄（ラベル + 必須 + 表示切替）を表示するセクション用クラス。
///
/// ※ セキュリティ上、初期値は常に空（ユーザー入力のみ）とする。
class _CurrentPasswordField extends StatelessWidget {
  const _CurrentPasswordField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: AppLabels.currentPassword,
      onChanged: onChanged,
      errorText: errorText,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// パスワード入力欄（ラベル + 必須 + 表示切替）を表示するセクション用クラス。
class _PasswordField extends StatelessWidget {
  const _PasswordField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: AppLabels.newPassword,
      onChanged: onChanged,
      errorText: errorText,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

/// パスワード再確認入力欄（ラベル + 必須 + 表示切替）を表示するセクション用クラス。
class _PasswordConfirmField extends StatelessWidget {
  const _PasswordConfirmField({required this.onChanged, this.errorText});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AuthPasswordField(
      label: AppLabels.passwordConfirm,
      onChanged: onChanged,
      errorText: errorText,
      isRequired: true,
      requiredMark: SvgPicture.asset(
        AppAssets.asteriskLogoSvg,
        width: 8,
        height: 8,
      ),
      textInputAction: TextInputAction.done,
    );
  }
}

/// 「更新」ボタンを表示するクラス。
class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: '更新',
      onPressed: onPressed,
      backgroundColor: cs.primary,
      textColor: cs.onPrimary,
      style: AuthActionButtonStyle.filled,
      isLoading: isLoading,
    );
  }
}
