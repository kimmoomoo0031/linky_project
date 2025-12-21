class LoungePreview {
  const LoungePreview({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    required this.colorSeed,
  });

  final int id;
  final String title;

  /// ラウンジのアイコン画像URL（S3など）。
  ///
  /// 未登録の場合は null とし、UI側はデフォルト画像（lounge_icon_logo）へフォールバックする。
  final String? thumbnailUrl;

  /// 画像が未確定な間のモック用（サムネイル背景色を変えるための seed）。
  final int colorSeed;
}


