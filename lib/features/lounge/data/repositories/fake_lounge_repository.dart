import 'package:linky_project_0318/core/constants/lounge_constants.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_info.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_post_search_item.dart';
import 'package:linky_project_0318/core/enums/lounge_post_search_target.dart';
import 'package:linky_project_0318/features/lounge/domain/entities/lounge_search_item.dart';
import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeLoungeRepository implements LoungeRepository {
  /// [Lounge/Mock] モックの総件数。
  static const int _poolSize = 100;

  final Map<int, List<MyPost>> _mainPoolCache = {};
  final Map<int, List<MyPost>> _bestPoolCache = {};
  late final List<LoungeSearchItem> _loungeSearchPool = _buildLoungeSearchPool();
  late final List<LoungePostSearchItem> _postSearchPool = _buildPostSearchPool();

  @override
  Future<LoungeInfo> getLoungeInfo({required int loungeId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    final base = loungeId.abs();
    final createdAt = DateTime(2025, 8, 14).subtract(Duration(days: base % 365));
    final totalPostCount = 120000 + (base % 9000);

    return LoungeInfo(
      loungeId: loungeId,
      title: base % 7 == 0 ? '日本生活' : 'ラウンジ（モック）#$loungeId',
      description: '内容です内容です内容です内容です内容です内容です内容です内容です内容です内容です',
      createdAt: createdAt,
      totalPostCount: totalPostCount,
      coverImageUrl: null,
    );
  }

  @override
  Future<LoungePostPage> getLoungePosts({
    required int loungeId,
    required int cursor,
    required int limit,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final pool = _mainPoolCache.putIfAbsent(
      loungeId,
      () => _buildMainPool(loungeId),
    );

    final slice = _slice(pool, cursor, limit);
    return LoungePostPage(
      items: slice.items,
      hasNext: slice.hasNext,
    );
  }

  @override
  Future<LoungePostPage> getBestPosts({
    required int loungeId,
    required int cursor,
    required int limit,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final pool = _bestPoolCache.putIfAbsent(
      loungeId,
      () => _buildBestPool(loungeId),
    );

    final slice = _slice(pool, cursor, limit);
    return LoungePostPage(
      items: slice.items,
      hasNext: slice.hasNext,
    );
  }

  @override
  Future<LoungeSearchPage> searchLounges({
    required String query,
    required int cursor,
    required int limit,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final q = query.trim().toLowerCase();
    if (q.isEmpty) {
      return const LoungeSearchPage(items: [], totalCount: 0, hasNext: false);
    }

    final filtered = _loungeSearchPool
        .where((e) => e.name.toLowerCase().contains(q))
        .toList();
    final slice = _slice(filtered, cursor, limit);
    return LoungeSearchPage(
      items: slice.items,
      totalCount: filtered.length,
      hasNext: slice.hasNext,
    );
  }

  @override
  Future<LoungePostSearchPage> searchLoungePosts({
    required String query,
    required LoungePostSearchTarget target,
    required int cursor,
    required int limit,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final q = query.trim().toLowerCase();
    if (q.isEmpty) {
      return const LoungePostSearchPage(items: [], totalCount: 0, hasNext: false);
    }

    final filtered = _postSearchPool.where((e) {
      switch (target) {
        case LoungePostSearchTarget.title:
          return e.title.toLowerCase().contains(q);
        case LoungePostSearchTarget.content:
          return e.content.toLowerCase().contains(q);
        case LoungePostSearchTarget.author:
          return e.nickname.toLowerCase().contains(q);
      }
    }).toList();

    final slice = _slice(filtered, cursor, limit);
    return LoungePostSearchPage(
      items: slice.items,
      totalCount: filtered.length,
      hasNext: slice.hasNext,
    );
  }

  @override
  Future<int> createLoungePost({
    required int loungeId,
    required String title,
    required String contentHtml,
    required String contentPlain,
    required List<String> imagePaths,
    String? guestNickname,
    String? guestPassword,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return DateTime.now().millisecondsSinceEpoch;
  }

  List<MyPost> _buildMainPool(int loungeId) {
    final now = DateTime.now();
    final baseLike = (loungeId.abs() % 7) * 20;
    final baseView = (loungeId.abs() % 11) * 50;

    return List<MyPost>.generate(_poolSize, (i) {
      final created = now.subtract(Duration(minutes: i * 13));
      return MyPost(
        id: loungeId * 100000 + i,
        title: 'テストタイトルですテストタイトルです',
        createdAt: created,
        nickname: i.isEven ? 'パインアップル' : 'リンゴ',
        viewCount: baseView + i * 10,
        likeCount: baseLike + (i % 5) * 50,
        hasImage: i % 3 == 1,
        isGuest: false,
      );
    });
  }

  List<MyPost> _buildBestPool(int loungeId) {
    final now = DateTime.now();
    final baseLike = LoungeConstants.popularStarMinLikeCount + 40;
    final baseView = (loungeId.abs() % 11) * 50;

    return List<MyPost>.generate(_poolSize, (i) {
      final created = now.subtract(Duration(minutes: i * 13));
      return MyPost(
        id: loungeId * 100000 + i,
        title: 'テストタイトルですテストタイトルです',
        createdAt: created,
        nickname: i.isEven ? 'パインアップル' : 'リンゴ',
        viewCount: baseView + i * 10,
        likeCount: baseLike + (i % 5) * 10,
        hasImage: i % 3 == 1,
        isGuest: i % 4 == 0,
      );
    });
  }

  List<LoungeSearchItem> _buildLoungeSearchPool() {
    return List<LoungeSearchItem>.generate(_poolSize, (i) {
      return LoungeSearchItem(
        name: i == 0 ? '日本生活' : 'ラウンジ（モック） #${i + 1}',
        totalPostCount: 10000 - i * 37,
      );
    });
  }

  List<LoungePostSearchItem> _buildPostSearchPool() {
    return List<LoungePostSearchItem>.generate(_poolSize, (i) {
      return LoungePostSearchItem(
        id: i + 1,
        title: i == 0 ? '初めての投稿' : '投稿タイトル（モック） #${i + 1}',
        content: '本文（モック） #${i + 1} サンプルテキストです。',
        createdAt: DateTime.now().subtract(Duration(hours: i * 3)),
        nickname: i.isEven ? 'リンゴ' : 'ゲスト',
        viewCount: 2000 - i * 13,
        likeCount: 500 - i * 7,
        hasImage: i % 3 == 0,
        isGuest: i.isOdd,
      );
    });
  }

  _SliceResult<T> _slice<T>(List<T> items, int cursor, int limit) {
    final start = cursor.clamp(0, items.length);
    final end = (cursor + limit).clamp(0, items.length);
    final slice = items.sublist(start, end);
    return _SliceResult(items: slice, hasNext: end < items.length);
  }
}

class _SliceResult<T> {
  const _SliceResult({
    required this.items,
    required this.hasNext,
  });

  final List<T> items;
  final bool hasNext;
}


