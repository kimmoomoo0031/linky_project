/// アセットパスを一箇所に集約するための定義。
///
/// - パス変更（フォルダ移動）や差し替え（リブランディング）時に修正箇所を1箇所にする
/// - タイポ（文字列の打ち間違い）を減らす
/// - どの画面/機能で使うアセットかを把握しやすいように、用途ごとにセクション分けする
class AppAssets {
  AppAssets._();

  static const _common = 'assets/images/common';
  static const _html = 'assets/html';

  // ---- 共通（多画面で使用）(svg) ----
  /// アプリのロゴ（ホーム上部/完了画面など複数画面で使用）。
  static const linkyLogoSvg = '$_common/linky_logo.svg';

  /// 戻るアイコン（共通 AppBar の back ボタン）。
  static const backLogoSvg = '$_common/back_logo.svg';

  /// ヘルプ（?）アイコン（入力ルール/ヘルプ導線など）。
  static const helpCircleLogoSvg = '$_common/helpcircle_logo.svg';

  /// 必須マーク（*）アイコン（必須項目ラベルに使用）。
  static const asteriskLogoSvg = '$_common/asterisk_logo.svg';

  /// 警告トライアングル（注意/警告の表示で使用）。
  static const alertTriangleLogoSvg = '$_common/alert_triangle_logo.svg';

  /// 失敗（×）アイコン（エラー表示/失敗ダイアログで使用）。
  static const failXLogoSvg = '$_common/red_x_logo.svg';

  /// 警告アイコン（警告ダイアログで使用）。
  static const warningLogoSvg = '$_common/warning_logo.svg';

  // ---- メイン画面（Home）(svg) ----
  /// 通知ベル（ホーム AppBar 左側の通知導線）。
  static const bellLogoSvg = '$_common/bell_logo.svg';

  /// メニュー（リスト）アイコン（ホーム AppBar 右側のメニュー導線）。
  static const mainScreenListLogoSvg = '$_common/main_screen_list_logo.svg';

  // ---- テーマ切替（ダーク/ライト）(svg) ----
  /// ダークモード切替アイコン（メニュー内のモード切替で使用）。
  static const darkModeLogoSvg = '$_common/dark_mode_logo.svg';

  /// ライトモード切替アイコン（メニュー内のモード切替で使用）。
  static const lightModeLogoSvg = '$_common/light_mode_logo.svg';

  // ---- 認証（ログイン/登録）(svg) ----
  /// LINE ログインアイコン（ログイン/登録画面のSNS導線）。
  static const lineLogoSvg = '$_common/line_logo.svg';

  /// Google ログインアイコン（ログイン/登録画面のSNS導線）。
  static const googleLogoSvg = '$_common/google_logo.svg';

  /// ゲスト導線アイコン（ゲストゲート/ゲストログイン導線）。
  static const guestSignupLogoSvg = '$_common/guest_signup_logo.svg';

  /// ユーザーアイコン（入力欄のアイコン、投稿カードなど）。
  static const userLogoSvg = '$_common/user_logo.svg';

  // ---- 検索 (svg) ----
  /// 検索クリア（×）アイコン（検索バーのクリアボタン）。
  static const searchXButtonLogoSvg = '$_common/search_x_button_logo.svg';

  /// 検索アイコン（検索バーの虫眼鏡）。
  static const searchLogoSvg = '$_common/search_logo.svg';

  /// 検索条件リストアイコン（投稿検索のフィルタボタン）。
  static const searchListLogoSvg = '$_common/search_list_logo.svg';

  // ---- 画像選択（投稿/ラウンジ作成など）(svg) ----
  /// 画像アイコン（画像エリアのプレースホルダ等）。
  static const imageLogoSvg = '$_common/image_logo.svg';

  /// 画像選択アイコン（画像を選ぶ導線ボタン）。
  static const selectImageLogoSvg = '$_common/select_image_logo.svg';

  /// [Lounge/PostCreate] 画像添付アイコン（投稿画面のツールバー）。
  static const writeImageLogoSvg = '$_common/wirte_image_logo.svg';

  /// [Lounge/PostCreate] 動画添付アイコン（投稿画面のツールバー）。
  static const videoLogoSvg = '$_common/video_logo.svg';

  // ---- ドロップダウン（フォーム）(svg) ----
  /// ドロップダウン下矢印（閉じている時）。
  static const arrowDownLogoSvg = '$_common/arrow_down_logo.svg';

  /// ドロップダウン上矢印（開いている時）。
  static const arrowUpLogoSvg = '$_common/arrow_up_logo.svg';

  // ---- 投稿/表示 (svg) ----
  /// ベスト投稿アイコン（投稿カードのベスト表示）。
  static const bestLogoSvg = '$_common/best_logo.svg';

  /// ユーザー確認（チェック）アイコン（投稿カードなどのステータス表示）。
  static const userCheckLogoSvg = '$_common/user_check_logo.svg';

  // ---- プロフィール (svg) ----
  /// プロフィール更新成功アイコン（プロフィール編集成功ダイアログ）。
  static const editProfileSuccessSvg = '$_common/edit_profile_success_logo.svg';

  // ---- ラウンジ (svg) ----
  /// ラウンジアイコン（ラウンジ関連のカード/一覧で使用）。
  static const loungeIconLogoSvg = '$_common/lounge_icon_logo.svg';

  /// お知らせ既読アイコン（ラウンジのお知らせ既読表示）。
  static const loungeAnnouncementReadSvg = '$_common/lounge_announcement_read_logo.svg';

  // ---- 通知 (svg) ----
  /// 通知を全既読にする（ゴミ箱）アイコン（通知一覧の AppBar 右上）。
  static const clearNotificationLogoSvg = '$_common/clear_notification_logo.svg';

  // ---- 認証（パスワードリセット）(png) ----
  /// パスワードリセット用の画像（パスワードリセット関連画面）。
  static const passwordResetLogoPng = '$_common/password_reset_logo.png';

  /// [Lounge/PostCreate] 投稿本文に挿入するダミー画像。
  static const startLinkyLogoPng = '$_common/start_linky_logo.png';

  // ---- ラウンジ (svg) ----
  /// ラウンジ画像未登録時のデフォルト画像（SVG）。
  static const loungeDefaultImgSvg = '$_common/lounge_default_img.svg';

  // ---- html ----
  static const termsOfServiceJaHtml = '$_html/terms_of_service_ja.html';
}


