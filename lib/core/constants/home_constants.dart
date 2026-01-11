/// Home機能の表示/取得に関する定数。
///
/// “画面都合の数値” は Controller に直書きせず、ここに集約する。
class HomeConstants {
  const HomeConstants._();

  /// 最近閲覧の1ページあたり件数（API/RepositoryのpageSize）。
  static const int latestPageSize = 6;

  /// 最近閲覧の最大ページ数（最大件数の上限を決める）。
  static const int latestMaxPages = 10;

  /// 最近閲覧の最大件数。
  static const int latestMaxItems = latestPageSize * latestMaxPages;

  /// 初回にまとめて取得する最近閲覧件数。
  /// 方針: 最大10ページ（=最大60件）を最初の1回で取得する。
  static const int initialLatestSize = latestMaxItems;

  /// ベスト投稿の取得上限。
  static const int bestPostsLimit = 10;
}