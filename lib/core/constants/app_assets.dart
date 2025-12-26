/// アセットパスを一箇所に集約するための定義。
///
/// - パス変更（フォルダ移動）や差し替え（リブランディング）時に修正箇所を1箇所にする
/// - タイポ（文字列の打ち間違い）を減らす
class AppAssets {
  AppAssets._();

  static const _common = 'assets/images/common';
  static const _html = 'assets/html';

  // ---- common (svg) ----
  static const linkyLogoSvg = '$_common/linky_logo.svg';
  static const backLogoSvg = '$_common/back_logo.svg';
  static const helpCircleLogoSvg = '$_common/helpcircle_logo.svg';
  static const asteriskLogoSvg = '$_common/asterisk_logo.svg';
  static const bellLogoSvg = '$_common/bell_logo.svg';
  static const mainScreenListLogoSvg = '$_common/main_screen_list_logo.svg';
  static const loungeIconLogoSvg = '$_common/lounge_icon_logo.svg';
  static const lineLogoSvg = '$_common/line_logo.svg';
  static const googleLogoSvg = '$_common/google_logo.svg';
  static const userLogoSvg = '$_common/user_logo.svg';
  static const alertTriangleLogoSvg = '$_common/alert_triangle_logo.svg';
  static const failXLogoSvg = '$_common/red_x_logo.svg';
  static const warningLogoSvg = '$_common/warning_logo.svg';
  static const darkModeLogoSvg = '$_common/dark_mode_logo.svg';
  static const lightModeLogoSvg = '$_common/light_mode_logo.svg';
  static const guestSignupLogoSvg = '$_common/guest_signup_logo.svg';
  static const searchXButtonLogoSvg = '$_common/search_x_button_logo.svg';
  static const searchLogoSvg = '$_common/search_logo.svg';
  static const imageLogoSvg = '$_common/image_logo.svg';
  static const bestLogoSvg = '$_common/best_logo.svg';
  static const userCheckLogoSvg = '$_common/user_check_logo.svg';
  static const editProfileSuccessSvg = '$_common/edit_profile_success_logo.svg';
  static const loungeAnnouncementReadSvg = '$_common/lounge_announcement_read_logo.svg';

  // ---- common (png) ----
  static const passwordResetLogoPng = '$_common/password_reset_logo.png';

  // ---- html ----
  static const termsOfServiceJaHtml = '$_html/terms_of_service_ja.html';
}


