import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/widgets/labeled_field.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';
import 'package:linky_project_0318/features/user/user_providers.dart';

/// プロフィール編集画面（モック）。
class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _nicknameCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  bool _didInitText = false;

  @override
  void dispose() {
    _nicknameCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileEditControllerProvider);
    final controller = ref.read(profileEditControllerProvider.notifier);
    final cs = Theme.of(context).colorScheme;

    // 1回限りのダイアログイベント
    ref.listen(profileEditDialogEventProvider, (previous, next) async {
      final event = next;
      if (event == null) return;
      await showLinkyDialog(
        context: context,
        title: event.title,
        message: event.message,
        type: event.type,
      );
      ref.read(profileEditDialogEventProvider.notifier).state = null;
    });

    // 初回ロード完了後に TextEditingController へ反映（カーソルが飛ばないように1回だけ）。
    if (!state.isLoading && !_didInitText) {
      _didInitText = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _nicknameCtrl.text = state.nickname;
        _bioCtrl.text = state.bio;
      });
    }

    return Scaffold(
      appBar: const LinkyAppBar(title: 'プロフィール編集', showBackButton: true),
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LabeledField(
                      label: 'メールアドレス',
                      child: TextField(
                        enabled: false,
                        decoration: _decor(hintText: state.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    LabeledField(
                      label: 'ニックネーム',
                      isRequired: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _nicknameCtrl,
                            onChanged: controller.onNicknameChanged,
                            decoration: _decor(hintText: 'リンゴ'),
                          ),
                          if (state.nicknameError != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              state.nicknameError!,
                              style: TextStyle(color: cs.error),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    LabeledField(
                      label: '自己紹介',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _bioCtrl,
                            onChanged: controller.onBioChanged,
                            decoration: _decor(hintText: 'よろしくお願いします。'),
                            maxLines: 4,
                          ),
                          if (state.bioError != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              state.bioError!,
                              style: TextStyle(color: cs.error),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    AuthActionButton(
                      label: '保存する',
                      onPressed: state.isSaving ? null : controller.save,
                      backgroundColor: cs.primary,
                      textColor: cs.onPrimary,
                      style: AuthActionButtonStyle.filled,
                      isLoading: state.isSaving,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  InputDecoration _decor({required String hintText}) {
    final cs = Theme.of(context).colorScheme;
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: cs.onSurfaceVariant),
      filled: true,
      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.primary),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.outlineVariant),
      ),
    );
  }
}


