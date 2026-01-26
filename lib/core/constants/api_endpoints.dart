/// Linky バックエンドの REST API エンドポイントを一元管理する定数クラス。
///
/// - 設計書: `プロジェクト設定書/LINKY_README_API設計.md` をソース・オブ・トゥルースとし、
///   その内容をこのクラスにミラーリングする想定。
/// - 各 `*_api_service.dart`（Retrofit インターフェイス）では、
///   文字列の直書きではなく本クラスの定数を参照する。
class ApiEndpoints {
  const ApiEndpoints._();

  // 1. Auth
  static const String authRegister = '/auth/register';
  static const String authLogin = '/auth/login';
  static const String authLogout = '/auth/logout';
  static const String authRefresh = '/auth/refresh';
  static const String authPasswordForgot = '/auth/password/forgot';
  static const String authPasswordReset = '/auth/password/reset';
  static const String authVerifyEmail = '/auth/verify-email';
  static const String authLineLogin = '/auth/line/login';
  static const String authGoogleLogin = '/auth/google/login';

  // 2. Users / MyPage
  static const String usersMe = '/users/me';
  static const String usersMePosts = '/users/me/posts';

  // 3. Lounge
  static const String lounges = '/lounges';
  static const String loungesRecent = '/lounges/recent';
  // Retrofit の @GET ではパスパラメータ付きのリテラルが必要なのでテンプレートも定義しておく。
  static const String loungeDetailTemplate = '/lounges/{lounge_id}';
  static const String loungePostsTemplate = '/lounges/{lounge_id}/posts';
  static String loungeDetail(String loungeId) => '/lounges/$loungeId';
  static String loungePosts(String loungeId) => '/lounges/$loungeId/posts';

  // 4. Post
  static const String postDetailTemplate = '/posts/{post_id}';
  static const String postCreate = '/posts';
  static const String postCreateGuest = '/posts/guest';
  static const String postUpdateTemplate = '/posts/{post_id}';
  static const String postDeleteTemplate = '/posts/{post_id}';
  static const String postLikeTemplate = '/posts/{post_id}/like';
  static const String postDislikeTemplate = '/posts/{post_id}/dislike';
  static const String postsBest = '/posts/best';
  static String postDetail(String postId) => '/posts/$postId';
  static String postUpdate(String postId) => '/posts/$postId';
  static String postDelete(String postId) => '/posts/$postId';
  static String postLike(String postId) => '/posts/$postId/like';
  static String postDislike(String postId) => '/posts/$postId/dislike';

  // 5. Comment
  static const String postCommentsTemplate = '/posts/{post_id}/comments';
  static const String postCommentsGuestTemplate =
      '/posts/{post_id}/comments/guest';
  static const String commentDeleteTemplate = '/comments/{comment_id}';
  static String postComments(String postId) => '/posts/$postId/comments';
  static String postCommentsGuest(String postId) =>
      '/posts/$postId/comments/guest';
  static String commentDelete(String commentId) => '/comments/$commentId';

  // 6. Notification
  static const String notifications = '/notifications';
  static const String notificationsUnreadCount =
      '/notifications/unread-count';
  static const String notificationReadTemplate = '/notifications/{id}/read';
  static const String notificationSettings = '/notification-settings';

  // 7. Lounge Request
  static const String loungeRequests = '/lounge-requests';

}


