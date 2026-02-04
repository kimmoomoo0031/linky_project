/// GoRouter の route name を集約する。
///
/// - `context.goNamed(...)` / `context.pushNamed(...)` の呼び出し側で
///   文字列を直書きしないための定数。
class AppRouteNames {
  AppRouteNames._();

  static const splash = 'splash';
  static const login = 'login';
  static const home = 'home';

  static const lounge = 'lounge'; // /lounge/:id?tab=...
  static const loungePostSearch = 'loungePostSearch';
  static const loungeSearch = 'loungeSearch';
  static const loungeCreate = 'loungeCreate';
  static const loungePostCreate = 'loungePostCreate';

  static const myPosts = 'myPosts';
  static const profileEdit = 'profileEdit';
  static const withdraw = 'withdraw';
  static const withdrawCompleted = 'withdrawCompleted';
  static const notificationSettings = 'notificationSettings';
  static const notifications = 'notifications';

  static const postCreate = 'postCreate';

  static const terms = 'terms';
  static const privacy = 'privacy';
  static const signUpAgreement = 'signUpAgreement';
  static const signUp = 'signUp';
  static const signUpSuccess = 'signUpSuccess';

  static const passwordReset = 'passwordReset';
  static const passwordResetCode = 'passwordResetCode';
  static const passwordResetNewPassword = 'passwordResetNewPassword';
  static const passwordResetSuccess = 'passwordResetSuccess';
}


