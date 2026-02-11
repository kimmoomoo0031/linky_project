import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/features/post/domain/entities/post_detail.dart';
import 'package:linky_project_0318/features/post/domain/entities/reaction_counts.dart';
import 'package:linky_project_0318/features/post/enums/reaction_type.dart';
import 'package:linky_project_0318/features/post/domain/repositories/post_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakePostRepository implements PostRepository {
  static final List<MyPost> _posts = () {
    final now = DateTime.now();
    return <MyPost>[
      // 今日ではない（yyyy/MM/dd 表示）
      MyPost(
        id: 1,
        title: 'テストタイトルですテストタイトルです',
        createdAt: now.subtract(const Duration(days: 20)),
        nickname: 'リンゴ',
        viewCount: 100,
        likeCount: 100,
        hasImage: true,
        isGuest: false,
      ),
      // 今日（HH:mm 表示）
      MyPost(
        id: 2,
        title: 'テストタイトルですテストタイトルです',
        createdAt: now.subtract(const Duration(minutes: 5)),
        nickname: 'パイナップル',
        viewCount: 10,
        likeCount: 0,
        hasImage: false,
        isGuest: true,
      ),
      // 今日（★表示：いいね >= 20）
      MyPost(
        id: 3,
        title: 'テストタイトルですテストタイトルです',
        createdAt: now.subtract(const Duration(minutes: 12)),
        nickname: 'パイナップル',
        viewCount: 10,
        likeCount: 200,
        hasImage: false,
        isGuest: false,
      ),
      // 追加モック（スクロール確認用）
      ...List.generate(17, (i) {
        final id = i + 4;
        final createdAt =
            i.isEven ? now.subtract(Duration(days: i + 1)) : now.subtract(Duration(minutes: 30 + i));
        return MyPost(
          id: id,
          title: '自分の投稿（モック） #$id',
          createdAt: createdAt,
          nickname: i.isEven ? 'テストユーザー' : 'ゲスト',
          viewCount: 3 + i * 2,
          likeCount: i * 5,
          hasImage: i % 3 == 0,
          isGuest: i.isOdd,
        );
      }),
    ];
  }();

  final Map<String, PostDetail> _detailCache = {};

  @override
  Future<List<MyPost>> getMyPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _posts;
  }

  @override
  Future<PostDetail> getPostDetail({required String postId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    return _detailCache.putIfAbsent(postId, () {
      final now = DateTime.now();
      return PostDetail(
        id: postId,
        title: 'テストタイトルですテストタイトルです',
        contentPlain: '内容です内容です内容です内容です内容です内容です',
        authorNickname: 'リンゴ',
        authorIsGuest: false,
        createdAt: now.subtract(const Duration(days: 1)),
        viewCount: 100,
        commentCount: 23,
        likeCount: 999,
        dislikeCount: 999,
        myReaction: ReactionType.none,
      );
    });
  }

  @override
  Future<ReactionCounts> likePost({required String postId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final cur = await getPostDetail(postId: postId);
    final next = cur.copyWith(
      likeCount: cur.likeCount + 1,
      myReaction: ReactionType.like,
    );
    _detailCache[postId] = next;
    return ReactionCounts(likeCount: next.likeCount, dislikeCount: next.dislikeCount);
  }

  @override
  Future<ReactionCounts> dislikePost({required String postId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final cur = await getPostDetail(postId: postId);
    final next = cur.copyWith(
      dislikeCount: cur.dislikeCount + 1,
      myReaction: ReactionType.dislike,
    );
    _detailCache[postId] = next;
    return ReactionCounts(likeCount: next.likeCount, dislikeCount: next.dislikeCount);
  }
}


