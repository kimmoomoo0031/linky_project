import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/enums/linky_dialog_type.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_labeled_text_field.dart';
import 'package:linky_project_0318/features/post/domain/entities/comment_item.dart';
import 'package:linky_project_0318/features/post/enums/comment_sort.dart';
import 'package:linky_project_0318/features/home/presentation/providers/home_providers.dart';
import 'package:linky_project_0318/features/post/enums/post_menu.dart';
import 'package:linky_project_0318/features/post/presentation/controllers/post_detail_controller.dart';
import 'package:linky_project_0318/features/post/presentation/providers/post_providers.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/post_detail_meta_header.dart';
import 'package:linky_project_0318/features/post/presentation/widgets/reaction_count_button.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  const PostDetailPage({super.key, required this.postId});

  final String postId;

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final _commentController = TextEditingController();
  final _commentFocusNode = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(postDetailSnackEventProvider, (prev, next) {
      if (next == null || next.trim().isEmpty) return;
      showLinkySnackBar(context, message: next);
      ref.read(postDetailSnackEventProvider.notifier).state = null;
    });

    final cs = Theme.of(context).colorScheme;
    final isGuest = ref.watch(homeControllerProvider).valueOrNull?.me.isGuest ?? false;
    final asyncData = ref.watch(postDetailControllerProvider(widget.postId));
    final controller =
        ref.read(postDetailControllerProvider(widget.postId).notifier);

    return Scaffold(
      appBar: LinkyAppBar(
        title: asyncData.valueOrNull?.post.title ?? '',
        showBackButton: true,
        onBackPressed: () {
          if (context.canPop()) {
            context.pop();
            return;
          }
          context.goHome();
        },
        actions: [
          PopupMenuButton<PostMenuAction>(
            icon: SvgPicture.asset(
              AppAssets.mainScreenListLogoSvg,
              width: 35,
              height: 35,
              colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
            ),
            onSelected: (v) {
              // TODO: 修正/削除の導線は後続で実装
              showLinkySnackBar(context, message: '未実装: ${v.label}');
            },
            itemBuilder: (context) => [
              LinkyPopupMenuItem<PostMenuAction>(
                value: PostMenuAction.edit,
                label: PostMenuAction.edit.label,
              ),
              PopupMenuItem<PostMenuAction>(
                enabled: false,
                height: 1,
                child: const LinkyDivider(),
              ),
              LinkyPopupMenuItem<PostMenuAction>(
                value: PostMenuAction.delete,
                label: PostMenuAction.delete.label,
                style: AppTextStyles.body14.copyWith(color: cs.error),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: asyncData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(
              '投稿の取得に失敗しました。',
              style: AppTextStyles.body14.copyWith(color: cs.error),
            ),
          ),
          data: (data) {
            final post = data.post;
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    children: [
                      PostDetailMetaHeader(post: post),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          AppAssets.startLinkyLogoPng,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        post.contentPlain,
                        style: AppTextStyles.body14.copyWith(
                          color: cs.onSurface,
                          height: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ReactionCountButton(
                        likeCount: post.likeCount,
                        dislikeCount: post.dislikeCount,
                        myReaction: post.myReaction,
                        disabled: data.isReacting,
                        onLike: controller.like,
                        onDislike: controller.dislike,
                      ),
                      const SizedBox(height: 20),
                      _CommentHeader(
                        count: post.commentCount,
                        isRefreshing: data.isRefreshingComments,
                        onRefresh: controller.refreshComments,
                      ),
                      const SizedBox(height: 10),
                      _CommentSortRow(
                        sort: data.sort,
                        onSelect: controller.setSort,
                      ),
                      const SizedBox(height: 8),
                      if (post.commentCount > 0)
                        ..._buildCommentTree(
                          context: context,
                          isGuest: isGuest,
                          data: data,
                          controller: controller,
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                _CommentInputSection(
                  isGuest: isGuest,
                  replyToNickname: data.replyToNickname,
                  onCancelReply: () => controller.setReplyTo(
                    commentId: null,
                    nickname: null,
                  ),
                  commentController: _commentController,
                  commentFocusNode: _commentFocusNode,
                  onTapInput: () => _commentFocusNode.requestFocus(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildCommentTree({
    required BuildContext context,
    required bool isGuest,
    required PostDetailViewData data,
    required PostDetailController controller,
  }) {
    final comments = data.comments;
    final parents = comments.where((c) => c.parentCommentId == null).toList();
    final byParent = <String, List<CommentItem>>{};
    for (final c in comments) {
      final p = c.parentCommentId;
      if (p == null) continue;
      (byParent[p] ??= []).add(c);
    }

    return [
      for (final parent in parents) ...[
        _CommentTile(
          item: parent,
          isReply: false,
          onTapReply: () {
            controller.setReplyTo(
              commentId: parent.id,
              nickname: parent.authorNickname,
            );
            _commentFocusNode.requestFocus();
          },
          onTapMore: parent.canDelete && !parent.isDeleted
              ? () => _handleDeleteComment(
                    context: context,
                    isGuest: isGuest,
                    commentId: parent.id,
                    controller: controller,
                  )
              : null,
        ),
        for (final reply in (byParent[parent.id] ?? const <CommentItem>[]))
          _CommentTile(
            item: reply,
            isReply: true,
            onTapReply: () {
              controller.setReplyTo(
                commentId: parent.id,
                nickname: parent.authorNickname,
              );
              _commentFocusNode.requestFocus();
            },
            onTapMore: reply.canDelete && !reply.isDeleted
                ? () => _handleDeleteComment(
                      context: context,
                      isGuest: isGuest,
                      commentId: reply.id,
                      controller: controller,
                    )
                : null,
          ),
        const LinkyDivider(height: 1, thickness: 1),
      ],
    ];
  }

  Future<void> _handleDeleteComment({
    required BuildContext context,
    required bool isGuest,
    required String commentId,
    required PostDetailController controller,
  }) async {
    if (isGuest) {
      final password = await showLinkyTextInputDialog(
        context: context,
        title: '削除',
        message: 'パスワードを入力してください',
        hintText: 'パスワード',
        confirmText: '削除',
        obscureText: true,
        isDestructive: true,
        barrierDismissible: true,
      );
      if (password == null) return;

      await controller.deleteComment(commentId: commentId, guestPassword: password);
      return;
    }

    final ok = await showLinkyConfirmDialog(
      context: context,
      title: '削除',
      message: 'コメントを削除しますか？',
      confirmText: '削除',
      type: LinkyDialogType.confirm,
      isDestructive: true,
      barrierDismissible: true,
    );
    if (!ok) return;
    await controller.deleteComment(commentId: commentId);
  }
}

class _CommentHeader extends StatelessWidget {
  const _CommentHeader({
    required this.count,
    required this.isRefreshing,
    required this.onRefresh,
  });

  final int count;
  final bool isRefreshing;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          'コメント $count',
          style: AppTextStyles.body14.copyWith(
            color: cs.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onRefresh,
          child: SvgPicture.asset(
            AppAssets.commentRefreshLogoSvg,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              cs.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          width: 18,
          height: 18,
          child: isRefreshing
              ? CircularProgressIndicator(
                  strokeWidth: 2,
                  color: cs.onSurfaceVariant,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _CommentSortRow extends StatelessWidget {
  const _CommentSortRow({required this.sort, required this.onSelect});

  final CommentSort sort;
  final ValueChanged<CommentSort> onSelect;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        _SortItem(
          label: '登録順',
          selected: sort == CommentSort.createdAtAsc,
          onTap: () => onSelect(CommentSort.createdAtAsc),
          cs: cs,
        ),
        const SizedBox(width: 24),
        _SortItem(
          label: '新着順',
          selected: sort == CommentSort.createdAtDesc,
          onTap: () => onSelect(CommentSort.createdAtDesc),
          cs: cs,
        ),
      ],
    );
  }
}

class _SortItem extends StatelessWidget {
  const _SortItem({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.cs,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Row(
          children: [
            Icon(
              Icons.check,
              size: 18,
              color: selected ? cs.primary : Colors.transparent,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.body14.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  const _CommentTile({
    required this.item,
    required this.isReply,
    required this.onTapReply,
    required this.onTapMore,
  });

  final CommentItem item;
  final bool isReply;
  final VoidCallback onTapReply;
  final VoidCallback? onTapMore;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final padLeft = isReply ? 26.0 : 0.0;
    final deletedLabel = isReply ? '削除されたコメントです' : 'ユーザーが削除したコメントです';
    final content = item.isDeleted ? deletedLabel : item.content;

    return Padding(
      padding: EdgeInsets.fromLTRB(padLeft, 12, 0, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReply)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.subdirectory_arrow_right,
                size: 18,
                color: cs.onSurfaceVariant,
              ),
            ),
          if (isReply) const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.authorNickname,
                        style: AppTextStyles.body14.copyWith(
                          color: cs.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!item.authorIsGuest) ...[
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        AppAssets.userCheckLogoSvg,
                        width: 12,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                          cs.onSurfaceVariant,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                    const Spacer(),
                    if (onTapMore != null)
                      InkWell(
                        onTap: onTapMore,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            AppAssets.commentMoreLogoSvg,
                            width: 18,
                            height: 18,
                            colorFilter: ColorFilter.mode(
                              cs.onSurfaceVariant,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: AppTextStyles.body14.copyWith(
                    color: item.isDeleted ? cs.onSurfaceVariant : cs.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentInputSection extends StatelessWidget {
  const _CommentInputSection({
    required this.isGuest,
    required this.replyToNickname,
    required this.onCancelReply,
    required this.commentController,
    required this.commentFocusNode,
    required this.onTapInput,
  });

  final bool isGuest;
  final String? replyToNickname;
  final VoidCallback onCancelReply;
  final TextEditingController commentController;
  final FocusNode commentFocusNode;
  final VoidCallback onTapInput;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: BoxDecoration(
          color: cs.surface,
          border: Border(top: BorderSide(color: cs.outlineVariant)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (replyToNickname != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '@$replyToNickname に返信',
                      style: AppTextStyles.body12.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onCancelReply,
                    child: Icon(Icons.close, color: cs.onSurfaceVariant, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            if (isGuest) ...[
              const _GuestFieldsSection(),
              const SizedBox(height: 10),
            ],
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTapInput,
              child: TextField(
                controller: commentController,
                focusNode: commentFocusNode,
                decoration: InputDecoration(
                  hintText: 'コメントを入力',
                  hintStyle: AppTextStyles.body14.copyWith(
                    color: cs.outlineVariant,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuestFieldsSection extends StatelessWidget {
  const _GuestFieldsSection();

  @override
  Widget build(BuildContext context) {
    // 入力値の保持/送信は後続（API 実装）で行う。UI だけ先に合わせる。
    return Row(
      children: const [
        Expanded(
          child: AuthLabeledTextField(
            label: '',
            hintText: 'ニックネーム',
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AuthLabeledTextField(
            label: '',
            hintText: 'パスワード',
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}


