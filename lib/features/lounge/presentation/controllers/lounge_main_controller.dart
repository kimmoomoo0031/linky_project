import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

/// ラウンジメイン（投稿一覧）を取得するコントローラ（モック）。
///
/// - 画面は「データ取得中心」なので AsyncNotifier を採用
/// - createdAt 降順（最新順）で表示する
class LoungeMainController extends FamilyAsyncNotifier<List<MyPost>, int> {
  @override
  Future<List<MyPost>> build(int loungeId) async {
    // TODO: 実API接続後は Repository 経由で取得する
    final now = DateTime.now();

    // モック：ラウンジIDに応じて見た目が少し変わるように seed を入れる
    final baseLike = (loungeId.abs() % 7) * 20;
    final baseView = (loungeId.abs() % 11) * 50;

    final items = List<MyPost>.generate(20, (i) {
      final created = now.subtract(Duration(minutes: i * 13));
      return MyPost(
        id: 10000 + i,
        title: 'テストタイトルですテストタイトルです',
        createdAt: created,
        nickname: i.isEven ? 'パインアップル' : 'リンゴ',
        viewCount: baseView + i * 10,
        likeCount: baseLike + (i % 5) * 50,
        hasImage: i % 3 == 1,
        isGuest: false,
      );
    })
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // 最新順

    return items;
  }
}

/// ラウンジメイン（投稿一覧）Provider。
final loungeMainControllerProvider = AsyncNotifierProviderFamily<
    LoungeMainController, List<MyPost>, int>(LoungeMainController.new);


