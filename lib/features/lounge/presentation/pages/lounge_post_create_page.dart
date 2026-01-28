import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fleather/fleather.dart';
import 'package:go_router/go_router.dart';
import 'package:parchment/parchment.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/enums/linky_dialog_type.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_post_create_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/lounge_dialog_event_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_post_create_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_post_create_state.dart';
import 'package:linky_project_0318/features/lounge/presentation/widgets/lounge_post_editor_section.dart';

/// ラウンジ投稿作成画面。
class LoungePostCreatePage extends ConsumerStatefulWidget {
  const LoungePostCreatePage({
    super.key,
    required this.loungeId,
    required this.isGuest,
  });

  final int loungeId;
  final bool isGuest;

  @override
  ConsumerState<LoungePostCreatePage> createState() =>
      _LoungePostCreatePageState();
}

class _LoungePostCreatePageState extends ConsumerState<LoungePostCreatePage> {
  late final LoungePostCreateArgs _args = LoungePostCreateArgs(
    loungeId: widget.loungeId,
    isGuest: widget.isGuest,
  );

  late final FocusNode _titleFocusNode = FocusNode();
  late final FocusNode _contentFocusNode = FocusNode();

  late final TextEditingController _titleController = TextEditingController();
  late final FleatherController _contentController = FleatherController(
    document: ParchmentDocument.fromJson(const [
      {'insert': '\n'}
    ]),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _titleFocusNode.requestFocus();
      }
    });

    _titleController.addListener(_onTitleChanged);
    _contentController.addListener(_onContentChanged);
  }

  @override
  void dispose() {
    _titleController.removeListener(_onTitleChanged);
    _contentController.removeListener(_onContentChanged);

    _titleController.dispose();
    _contentController.dispose();
    _titleFocusNode.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  void _onTitleChanged() {
    ref
        .read(loungePostCreateControllerProvider(_args).notifier)
        .onTitleChanged(_titleController.text);
  }

  void _onContentChanged() {
    final delta = _contentController.document.toDelta();
    final ops = delta.toJson();
    final deltaJson = jsonEncode(ops);

    ref.read(loungePostCreateControllerProvider(_args).notifier).onQuillChanged(
          plainText: _contentController.document.toPlainText(),
          deltaJson: deltaJson,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loungePostCreateDialogEventProvider, (previous, next) async {
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
      ref.read(loungePostCreateDialogEventProvider.notifier).state = null;

      if (event.type == LinkyDialogType.info && context.mounted) {
        context.pop();
      }
    });

    final state = ref.watch(loungePostCreateControllerProvider(_args));
    final controller = ref.read(
      loungePostCreateControllerProvider(_args).notifier,
    );

    return Scaffold(
      appBar: LinkyAppBar(
        title: '投稿',
        showBackButton: true,
        actions: [
          CompactActionButton(
            label: '投稿',
            onPressed: state.isSubmitting ? null : controller.submit,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.isGuest) ...[
              Padding(
                padding: const EdgeInsets.all(12),
                child: _GuestFieldsSection(
                  onNicknameChanged: controller.onGuestNicknameChanged,
                  onPasswordChanged: controller.onGuestPasswordChanged,
                ),
              ),
            ],
            Expanded(
              child: LoungePostEditorSection(
                titleController: _titleController,
                titleFocusNode: _titleFocusNode,
                contentController: _contentController,
                contentFocusNode: _contentFocusNode,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomToolbar(
        imageCount: state.attachedImageCount,
        onPickImage: () async {
          await _handlePickImage(controller);
        },
        onPickVideo: () {},
        editorController: _contentController,
      ),
    );
  }
//이미지 본문삽입작업
  Future<void> _handlePickImage(LoungePostCreateController controller) async {
    final newPaths = await controller.pickImage(context);
    if (!mounted) return;

    if (newPaths.isEmpty) return;

    _contentFocusNode.requestFocus();
  }
}

class _GuestFieldsSection extends StatelessWidget {
  const _GuestFieldsSection({
    required this.onNicknameChanged,
    required this.onPasswordChanged,
  });

  final ValueChanged<String> onNicknameChanged;
  final ValueChanged<String> onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthLabeledTextField(
            label: 'ニックネーム',
            hintText: 'ニックネーム',
            onChanged: onNicknameChanged,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AuthLabeledTextField(
            label: 'パスワード',
            hintText: 'パスワード',
            onChanged: onPasswordChanged,
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}

class _BottomToolbar extends StatelessWidget {
  const _BottomToolbar({
    required this.imageCount,
    required this.onPickImage,
    required this.onPickVideo,
    required this.editorController,
  });

  final int imageCount;
  final VoidCallback onPickImage;
  final VoidCallback onPickVideo;
  final FleatherController editorController;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: cs.surface,
            border: Border(top: BorderSide(color: cs.outlineVariant)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: _FleatherBottomToolbarRow(
            editorController: editorController,
            onPickImage: onPickImage,
            onPickVideo: onPickVideo,
          ),
        ),
      ),
    );
  }
}

class _FleatherBottomToolbarRow extends StatelessWidget {
  const _FleatherBottomToolbarRow({
    required this.editorController,
    required this.onPickImage,
    required this.onPickVideo,
  });

  final FleatherController editorController;
  final VoidCallback onPickImage;
  final VoidCallback onPickVideo;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const _NoGlowScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: '画像',
              onPressed: onPickImage,
              icon: const Icon(Icons.image_outlined, size: 25),
            ),
            IconButton(
              tooltip: '動画',
              onPressed: onPickVideo,
              icon: const Icon(Icons.videocam_outlined, size: 28),
            ),
            const SizedBox(width: 8),
            FleatherToolbar.basic(controller: editorController),
          ],
        ),
      ),
    );
  }
}

class _NoGlowScrollBehavior extends ScrollBehavior {
  const _NoGlowScrollBehavior();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
