class MyPost {
  const MyPost({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.nickname,
    required this.viewCount,
    required this.likeCount,
    required this.hasImage,
    required this.isGuest,
  });

  final int id;
  final String title;
  final DateTime createdAt;
  final String nickname;
  final int viewCount;
  final int likeCount;
  final bool hasImage;
  final bool isGuest;
}


