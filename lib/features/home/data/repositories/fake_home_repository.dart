import 'package:intl/intl.dart';

import '../../domain/entities/best_post.dart';
import '../../domain/entities/home_user.dart';
import '../../domain/entities/lounge_preview.dart';
import '../../domain/repositories/home_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeHomeRepository implements HomeRepository {
  static const bool _forceGuest =
      bool.fromEnvironment('FORCE_GUEST', defaultValue: false);

  static const HomeUser _dummyUser = HomeUser(
    nickname: 'テスト様',
    email: 'testuser@example.com',
    isGuest: false,
  );

  static const HomeUser _dummyGuest = HomeUser(
    nickname: 'ゲスト',
    email: '',
    isGuest: true,
  );

  static final List<LoungePreview> _latestPool = List.generate(18, (i) {
    final id = i + 1;
    final titles = [
      '日本生活',
      'エンジニア',
      '東京に住んでる\n人々の集まり',
      '韓国グルメ',
      '英会話',
      '週末旅行',
    ];
    return LoungePreview(
      id: id,
      title: titles[i % titles.length],
      // ユーザーが画像未登録の場合を想定（nullならUIはデフォルト画像を表示）
      thumbnailUrl: null,
      colorSeed: id * 997,
    );
  });

  static final List<BestPost> _bestPosts = List.generate(10, (i) {
    final id = i + 1;
    final date = DateTime.now().subtract(Duration(days: i * 3));
    final dateLabel = DateFormat('yyyy/MM/dd').format(date);
    return BestPost(
      id: id,
      title: 'テスト投稿です',
      dateLabel: dateLabel,
    );
  });

  @override
  Future<HomeUser> getMe() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _forceGuest ? _dummyGuest : _dummyUser;
  }

  @override
  Future<LoungePreviewPage> getLatestViewed({
    required int page,
    required int pageSize,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final start = (page - 1) * pageSize;
    if (start >= _latestPool.length) {
      return const LoungePreviewPage(items: [], hasNext: false);
    }

    final end = (start + pageSize).clamp(0, _latestPool.length);
    final items = _latestPool.sublist(start, end);
    final hasNext = end < _latestPool.length;
    return LoungePreviewPage(items: items, hasNext: hasNext);
  }

  @override
  Future<List<BestPost>> getBestPosts({required int limit}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _bestPosts.take(limit).toList(growable: false);
  }
}


