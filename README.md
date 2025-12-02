
## Linky フロントエンド (Flutter)

Linky プロジェクトの Flutter フロントエンドです。  
クリーンアーキテクチャ（`data / domain / presentation`）＋機能別フォルダ構成（`auth`, `lounge`, `post` など）で実装します。

---

## 技術スタック

- Flutter (Dart)
- 状態管理: `flutter_riverpod`
- ルーティング: `go_router`
- ネットワーク: `dio` + `retrofit`
- モデル生成: `freezed`, `json_serializable`, `build_runner`
- 設定 / ユーティリティ: `flutter_dotenv`, `intl`, `logger`

---

## セットアップ

1. 依存関係インストール

```bash
flutter pub get
```

2. アプリ起動

```bash
flutter run
```

---

## フォルダ構成 (概要)

- `lib/core`  
  アプリ全体で共通して使う設定、ルーティング、テーマ、ネットワーククライアント、ユーティリティ、共通ウィジェットを配置。

- `lib/features`  
  機能ごとのフォルダ（`auth`, `user`, `lounge`, `post`, `comment`, `notification`, `lounge_request`, `admin` など）を配置し、  
  それぞれの中で `data / domain / presentation` レイヤに分割。

Flutter 開発の一般的な情報については、公式ドキュメントを参照してください。  
- [Flutter ドキュメント](https://docs.flutter.dev/)
- 
## Linky

Linky は、テーマ別の「ラウンジ」の中で、ユーザー同士が **生活情報や経験を便利に共有すること** を目的としたアプリです。  
日本生活・エンジニアリング・留学・学校・ビザなど、トピックごとにラウンジを分けて投稿やコメントができます。

---

## プロジェクト概要

- 複数のラウンジごとに投稿・コメント・ベスト投稿を管理
- ログインユーザーだけでなく、ニックネーム＋パスワードによるゲスト投稿もサポート
- コメント通知やラウンジ申請通知など、運営目線の機能も提供
- 管理者用画面から投稿・ラウンジ申請をモデレーション可能

---

## 開発情報

- **開発人数**: 1 名（個人開発）
- **担当範囲**:
  - フロントエンド: Flutter アプリ設計・実装
  - バックエンド: FastAPI ベースの API 設計・エンドポイント設計
  - インフラ構成設計: AWS (EC2 / RDS / S3 / FCM 連携) の構想
- **開発期間**: 2025年11月〜

---

## 主な機能

### 認証・アカウント

- メールアドレス + パスワードによる新規登録 / ログイン / ログアウト
- メール認証（6 桁コード）、パスワードリセット、退会
- LINE / Google によるソーシャルログイン
- ゲスト投稿 / ゲストコメント（ニックネーム + パスワード）

### ラウンジ / ホーム

- ラウンジ一覧表示 (`GET /lounges`)
- ラウンジ詳細（そのラウンジ内の投稿一覧）
- 最近閲覧したラウンジ一覧 (`GET /lounges/recent`)
- ラウンジ内検索（タイトル / 内容 / 投稿者）

### 投稿（Post）

- ログインユーザー投稿 (`POST /posts`)
- ゲスト投稿 (`POST /posts/guest`)
- タイトル / 本文 / 画像（最大 10 枚）を登録
- 投稿詳細表示、閲覧数・コメント数の表示
- 投稿の編集 / 削除（作成者 or 管理者）
- おすすめ（いいね） / X 評価、いいね数に応じたベスト投稿登録

### コメント（Comment）

- 投稿ごとのコメント一覧（登録順 / 新着順）
- ログインユーザー / ゲスト両方のコメント・返信
- コメント削除（作成者 or ゲスト + パスワード一致）
- 実装上は `is_deleted = true` とし、「削除されたコメントです」と表示

### 通知 / 通知設定

- コメントがついたとき、ラウンジ申請が承認/却下されたときの通知一覧
- 未読件数取得 (`GET /notifications/unread-count`)
- 通知の既読化 (`PUT /notifications/{id}/read`)
- 通知設定の ON/OFF（コメント通知 / ラウンジ申請結果通知）

### ラウンジ申請 / 管理者

- ユーザーによるラウンジ作成申請 (`POST /lounge-requests`)
- 管理者向け:
  - 投稿管理一覧 / 詳細 / 削除
  - ラウンジ申請一覧 / 詳細
  - 承認: 新規ラウンジ作成 + 承認通知
  - 却下: 却下通知

---

## フロントエンド技術スタック

- **フレームワーク**: Flutter (Dart)
- **ターゲット**: iOS / Android

### アーキテクチャ

- クリーンアーキテクチャ
  - レイヤ構成: `data / domain / presentation`
  - 機能ごとのフォルダ分割:  
    `auth`, `user`, `lounge`, `post`, `comment`, `notification`, `lounge_request`, `admin` など
- 状態管理 / DI
  - `flutter_riverpod`
    - Provider / StateNotifier / AsyncNotifier
    - Repository / UseCase / Controller を Provider として注入
- ルーティング
  - `go_router`
    - 画面遷移、タブナビゲーション
    - ログイン必須画面のガード、ディープリンク対応を想定

### モデル / API 通信

- モデル / コード生成
  - `freezed`, `freezed_annotation`
  - `json_serializable`, `json_annotation`
  - `build_runner`
- ネットワーク
  - `dio` + `retrofit`
    - `@RestApi()` インターフェースから API クライアントを自動生成
    - 共通インターセプターで
      - Access Token 自動付与
      - リクエスト/レスポンスログ
      - 共通エラーハンドリング

### 環境 / ユーティリティ

- `flutter_dotenv`（API Base URL など環境ごとの設定）
- `intl`（日付フォーマット）
- `logger`（デバッグログ出力）

---

## 認証・トークン設計（概要）

- **Access Token**
  - JWT 形式
  - 有効期限: 約 30 分
  - 各 API に `Authorization: Bearer <access_token>` で送信
- **Refresh Token**
  - 有効期限: 約 60 日
  - クライアント: Secure Storage に「生」の文字列として保存
  - サーバー: DB にハッシュ値のみ保存（`refresh_tokens` テーブル）
  - カラム例: `user_id`, `token_hash`, `created_at`, `expires_at`, `revoked`
- `/auth/refresh` で Refresh Token を検証し、新しい Access Token を発行  
  ログアウトや強制ログアウト時は `revoked = true` として無効化

---

## 実行方法（フロントエンド）

# 依存関係のインストール
flutter pub get

# 開発モードで実行
flutter run`.env` などで設定した API Base URL に対して、バックエンド FastAPI と通信します。

---

## フォルダ構成（抜粋）

- `lib/core`
  - 共通設定、ルーティング、テーマ、Dio クライアント、ユーティリティ、共通ウィジェット
- `lib/features`
  - 機能ごと (`auth`, `lounge`, `post`, `comment`, `notification`, `lounge_request`, `admin` …) に
    - `data`（datasources, models, repositories）
    - `domain`（entities, repositories, usecases）
    - `presentation`（controllers, pages, widgets）  
  を配置

---

## コミットメッセージのプレフィックス規約

基本のフォーマット:

<タイプ>: 1行で簡潔な説明

例) feat: ラウンジ一覧画面のUIを実装### よく使うタイプ

- **feat**: 新機能の追加  
  - 例: `feat: ラウンジ検索機能を追加`

- **fix**: バグ修正  
  - 例: `fix: ログイン失敗時に正しいエラーメッセージを表示`

- **refactor**: 仕様変更なしのリファクタリング（コード整理・構造改善）  
  - 例: `refactor: authコントローラの責務を分割`

- **chore**: ビルド設定・依存関係更新・フォーマットなど、機能に直接関係ない雑多な変更  
  - 例: `chore: flutter_lints のバージョンを更新`

- **docs**: ドキュメントの追加・修正（README など）  
  - 例: `docs: プロジェクト概要と技術スタックを追記`

- **style**: コードスタイルのみの変更（インデント・空白・セミコロンなど、ロジックの変更なし）  
  - 例: `style: Dartフォーマッタを適用`

- **test**: テストコードの追加・修正  
  - 例: `test: auth usecase のテストを追加`

- **build**: ビルドシステムや外部依存関係に関する変更  
  - 例: `build: Android の minSdkVersion を変更`

- **revert**: 以前のコミットの取り消し  
  - 例: `revert: "feat: ラウンジ作成画面を追加" を取り消し`

- **chmod**: ファイル権限の変更（実行権限の付与など）  
  - 例: `chmod: スクリプトに実行権限を付与`

