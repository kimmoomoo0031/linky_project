/// Home機能の表示/取得に関する定数。
class HomeConstants {
  const HomeConstants._();

  /// [Home] 最近閲覧の1ページあたり件数（pageSize）。
  static const int latestPageSize = 6;

  /// [Home] 最近閲覧の最大ページ数（最大件数の上限）。
  static const int latestMaxPages = 10;

  /// [Home] ベスト投稿の取得上限。
  static const int bestPostsLimit = 10;

  /// [Home] 最近閲覧の最大件数。
  static const int latestMaxItems = latestPageSize * latestMaxPages;

  /// [Home] 初回にまとめて取得する最近閲覧件数（最大分を一括取得）。
  static const int initialLatestSize = latestMaxItems;
}