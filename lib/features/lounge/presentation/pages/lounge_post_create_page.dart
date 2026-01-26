import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/enums/linky_dialog_type.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_post_create_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/lounge_dialog_event_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_post_create_providers.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_post_create_state.dart';
import 'package:linky_project_0318/features/lounge/presentation/utils/quill_embed_inserter.dart';
import 'package:linky_project_0318/features/lounge/presentation/utils/lounge_post_quill_binder.dart';
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
  final ScrollController _titleEditorScrollController = ScrollController();
  final ScrollController _editorScrollController = ScrollController();
  late final quill.QuillController _titleQuillController =
      quill.QuillController.basic();
  late final quill.QuillController _quillController =
      quill.QuillController.basic();
  late final LoungePostQuillBinder _quillBinder;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _titleFocusNode.requestFocus();
      }
    });

    _quillBinder = LoungePostQuillBinder(
      titleController: _titleQuillController,
      contentController: _quillController,
      onTitleChanged: (title) {
        ref
            .read(loungePostCreateControllerProvider(_args).notifier)
            .onTitleChanged(title);
      },
      onContentChanged: ({required plainText, required deltaJson}) {
        ref
            .read(loungePostCreateControllerProvider(_args).notifier)
            .onQuillChanged(plainText: plainText, deltaJson: deltaJson);
      },
    )..bind();
  }

  @override
  void dispose() {
    _quillBinder.unbind();
    _quillController.dispose();
    _titleQuillController.dispose();
    _titleFocusNode.dispose();
    _contentFocusNode.dispose();
    _titleEditorScrollController.dispose();
    _editorScrollController.dispose();
    super.dispose();
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
                titleController: _titleQuillController,
                titleFocusNode: _titleFocusNode,
                titleScrollController: _titleEditorScrollController,
                contentController: _quillController,
                contentFocusNode: _contentFocusNode,
                contentScrollController: _editorScrollController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomToolbar(
        quillController: _quillController,
        imageCount: state.attachedImageCount,
        onPickImage: () async {
          await _handlePickImage(controller);
        },
        onPickVideo: () {},
      ),
    );
  }

  Future<void> _handlePickImage(LoungePostCreateController controller) async {
    final selectionBeforePicker = _quillController.selection;

    final newPaths = await controller.pickImage(context);
    if (!mounted) return;

    insertImagesIntoQuill(
      controller: _quillController,
      imagePaths: newPaths,
      initialSelection: selectionBeforePicker,
    );
    _contentFocusNode.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_editorScrollController.hasClients) return;
      _editorScrollController.animateTo(
        _editorScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      );
    });
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
    required this.quillController,
    required this.imageCount,
    required this.onPickImage,
    required this.onPickVideo,
  });

  final quill.QuillController quillController;
  final int imageCount;
  final VoidCallback onPickImage;
  final VoidCallback onPickVideo;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final cs = Theme.of(context).colorScheme;

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: bottomInset),
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: cs.surface,
            border: Border(top: BorderSide(color: cs.outlineVariant)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: _QuillBottomToolbarRow(
            controller: quillController,
            onPickImage: onPickImage,
            onPickVideo: onPickVideo,
          ),
        ),
      ),
    );
  }
}

class _QuillBottomToolbarRow extends StatelessWidget {
  const _QuillBottomToolbarRow({
    required this.controller,
    required this.onPickImage,
    required this.onPickVideo,
  });

  final quill.QuillController controller;
  final VoidCallback onPickImage;
  final VoidCallback onPickVideo;

  @override
  Widget build(BuildContext context) {
    const toolbarConfig = quill.QuillSimpleToolbarConfig(showDividers: false);
    final opts = toolbarConfig.buttonOptions;

    final buttons = <Widget>[
      quill.QuillToolbarIconButton(
        tooltip: '画像',
        icon: const Icon(Icons.image_outlined, size: 25),
        isSelected: false,
        onPressed: onPickImage,
        iconTheme: toolbarConfig.iconTheme,
      ),
      quill.QuillToolbarIconButton(
        tooltip: '動画',
        icon: const Icon(Icons.videocam_outlined, size: 28),
        isSelected: false,
        onPressed: onPickVideo,
        iconTheme: toolbarConfig.iconTheme,
      ),
      quill.QuillToolbarLinkStyleButton(
        controller: controller,
        options: opts.linkStyle,
        baseOptions: opts.base,
      ),
      quill.QuillToolbarSearchButton(
        controller: controller,
        options: opts.search,
        baseOptions: opts.base,
      ),
      quill.QuillToolbarFontFamilyButton(
        controller: controller,
        options: opts.fontFamily,
        baseOptions: opts.base,
      ),
      quill.QuillToolbarFontSizeButton(
        controller: controller,
        options: opts.fontSize,
        baseOptions: opts.base,
      ),
      quill.QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: quill.Attribute.bold,
        options: opts.bold,
        baseOptions: opts.base,
      ),
      quill.QuillToolbarColorButton(
        controller: controller,
        isBackground: false,
        options: opts.color,
        baseOptions: opts.base,
      ),
    ];

    return ScrollConfiguration(
      behavior: const _NoGlowScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < buttons.length; i++) ...[
              if (i != 0) const SizedBox(width: 8),
              buttons[i],
            ],
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
