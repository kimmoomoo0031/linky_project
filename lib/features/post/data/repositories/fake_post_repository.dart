import 'package:intl/intl.dart';

import '../../domain/entities/my_post.dart';
import '../../domain/repositories/post_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakePostRepository implements PostRepository {
  static final List<MyPost> _posts = List.generate(20, (i) {
    final id = i + 1;
    final date = DateTime.now().subtract(Duration(days: i));
    final dateLabel = DateFormat('yyyy/MM/dd').format(date);
    return MyPost(
      id: id,
      title: '自分の投稿（モック） #$id',
      dateLabel: dateLabel,
    );
  });

  @override
  Future<List<MyPost>> getMyPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _posts;
  }
}


