import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/constants/auth_constants.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';
import 'package:linky_project_0318/features/auth/presentation/providers/register_providers.dart';

/// 新規登録前の同意チェック画面（スター◯ックス風のレイアウト）。
class SignUpAgreementPage extends ConsumerStatefulWidget {
  const SignUpAgreementPage({super.key});

  @override
  ConsumerState<SignUpAgreementPage> createState() =>
      _SignUpAgreementPageState();
}

class _SignUpAgreementPageState extends ConsumerState<SignUpAgreementPage> {
  bool _agreedTerms = false;
  bool _agreedPrivacy = false;

  bool get _agreedAll => _agreedTerms && _agreedPrivacy;

  void _setAll(bool value) {
    setState(() {
      _agreedTerms = value;
      _agreedPrivacy = value;
    });
  }

  Future<void> _openTerms() async {
    final agreed = await context.pushTerms();
    if (agreed == true) {
      setState(() => _agreedTerms = true);
    }
  }

  Future<void> _openPrivacy() async {
    final agreed = await context.pushPrivacyPolicy();
    if (agreed == true) {
      setState(() => _agreedPrivacy = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: LinkyAppBar(
        title: '',
        showBackButton: true,
        onBackPressed: () => context.pop(false),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Container(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  AppAssets.linkyLogoSvg,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(height: 16),
              GradientText(
                'Linkyへようこそ！',
                gradient: AppColors.linky45degGradient,
                style: AppTextStyles.heading24,
              ),
              const SizedBox(height: 8),
              Text(
                AuthConstants.signUpAgreementDescription,
                style: AppTextStyles.body14.copyWith(color: cs.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              const Spacer(flex: 3),
              // 同意カード
              Container(
                decoration: BoxDecoration(
                  color: cs.surface,
                  border: Border.all(color: cs.outlineVariant),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _AgreementCheckboxRow(
                      checked: _agreedAll,
                      label: '規約に一括同意',
                      onToggle: _setAll,
                      showChevron: false,
                      onPressedRow: null,
                    ),
                    Divider(height: 1, color: cs.outlineVariant),
                    _AgreementCheckboxRow(
                      checked: _agreedTerms,
                      label: '利用規約に同意（必須）',
                      onToggle: (v) => setState(() => _agreedTerms = v),
                      showChevron: true,
                      onPressedRow: _openTerms,
                    ),
                    Divider(height: 1, color: cs.outlineVariant),
                    _AgreementCheckboxRow(
                      checked: _agreedPrivacy,
                      label: 'プライバシーポリシーに同意（必須）',
                      onToggle: (v) => setState(() => _agreedPrivacy = v),
                      showChevron: true,
                      onPressedRow: _openPrivacy,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AuthActionButton(
                label: '次へ',
                onPressed: _agreedAll
                    ? () {
                        final termsVersion = ref.read(termsVersionProvider);
                        context.pushSignUp(
                          extra: <String, dynamic>{
                            'signUp_Agreement': true,
                            'terms_version': termsVersion,
                          },
                        );
                      }
                    : null,
                backgroundColor: _agreedAll ? cs.primary : cs.surface,
                textColor: _agreedAll ? cs.onPrimary : cs.onSurfaceVariant,
                borderColor: cs.outlineVariant,
                style: AuthActionButtonStyle.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgreementCheckboxRow extends StatelessWidget {
  const _AgreementCheckboxRow({
    required this.checked,
    required this.label,
    required this.onToggle,
    required this.showChevron,
    required this.onPressedRow,
  });

  final bool checked;
  final String label;
  final ValueChanged<bool> onToggle;
  final bool showChevron;
  final VoidCallback? onPressedRow;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onPressedRow,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          children: [
            Checkbox(
              value: checked,
              onChanged: (v) => onToggle(v ?? false),
            ),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body14.copyWith(color: cs.onSurface),
              ),
            ),
            if (showChevron)
              Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}

