import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/terms_texts.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';

/// 利用規約画面。
/// 共通ヘッダー + スクロール可能な規約テキスト + 「同意する / 同意しない」ボタン構成。
class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({super.key});

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  final ScrollController _scrollController = ScrollController();
  bool _hasReachedBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;

    // 最下部（maxScrollExtent）に到達したタイミングでのみ true にする。
    if (!_hasReachedBottom && position.pixels >= position.maxScrollExtent) {
      setState(() {
        _hasReachedBottom = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool canAgree = _hasReachedBottom;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(
        title: '利用規約',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                    ),
                    child: Text(
                      TermsTexts.termsOfServiceJa,
                      style: AppTextStyles.body14.copyWith(
                        color: AppColors.primaryBlack,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AuthActionButton(
                label: '同意する',
                onPressed: canAgree
                    ? () {
                        context.push('/signUp');
                      }
                    : null,
                backgroundColor: AppColors.primaryActionBlue,
                textColor: AppColors.primaryWhite,
                style: AuthActionButtonStyle.filled,
              ),
              const SizedBox(height: 24),
              AuthActionButton(
                label: '同意しない',
                onPressed: () {
                  context.pop(false);
                },
                backgroundColor: AppColors.primaryWhite,
                textColor: AppColors.primaryGray,
                borderColor: AppColors.outlineGray,
                style: AuthActionButtonStyle.outlined,
              ),
              const SizedBox(height: 8),
              Text(
                '上記の利用規約をよくお読みいただき、内容に同意いただける場合は「同意する」を押してください。',
                style: AppTextStyles.body12.copyWith(
                  color: AppColors.primaryGray,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

