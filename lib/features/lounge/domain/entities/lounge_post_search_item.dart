import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

class LoungePostSearchItem {
  const LoungePostSearchItem({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.nickname,
    required this.viewCount,
    required this.likeCount,
    required this.hasImage,
    required this.isGuest,
  });

  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final String nickname;
  final int viewCount;
  final int likeCount;
  final bool hasImage;
  final bool isGuest;

  MyPost toMyPost() {
    return MyPost(
      id: id,
      title: title,
      createdAt: createdAt,
      nickname: nickname,
      viewCount: viewCount,
      likeCount: likeCount,
      hasImage: hasImage,
      isGuest: isGuest,
    );
  }
}


