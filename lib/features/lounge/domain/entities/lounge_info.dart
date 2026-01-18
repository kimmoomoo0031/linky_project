class LoungeInfo {
  const LoungeInfo({
    required this.loungeId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.totalPostCount,
    this.coverImageUrl,
  });

  final int loungeId;
  final String title;
  final String description;
  final DateTime createdAt;
  final int totalPostCount;

  /// ラウンジのカバー画像URL（S3など）。未登録の場合は null。
  final String? coverImageUrl;
}


