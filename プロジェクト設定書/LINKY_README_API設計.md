## Linky バックエンド API 設計（エンドポイント一覧）

このドキュメントは、Linky プロジェクトのバックエンド API エンドポイントを整理した README です。  
画面仕様（Figma）と機能一覧をもとに、最小限必要な API をまとめています。

---

## 1. 認証 / アカウント (Auth)

- `POST   /auth/register`  
  - メールアドレス・パスワード・ニックネームで新規登録
  - 利用規約の同意情報も同時に送信する

  **Request 例**
  //POST /auth/register
  //Content-Type: application/json
  ```json

  {
    "email": "user@example.com",
    "password": "password1234",
    "nickname": "taro",

    "terms_agreed": true,
    "terms_version": "2025-01-01"
  }
  ```

  - `terms_agreed` : 利用規約に同意した場合は `true`。未同意なら `false` またはフィールド自体を送信しない。
  - `terms_version` : 同意時点の利用規約バージョンまたは施行日（例: `"2025-01-01"`）。クライアント側の定数 `currentTermsVersion` と一致させる。

  **サーバー側の想定挙動**

  - `terms_agreed == true` の場合、ユーザーレコードに以下を保存する:
    - `terms_accepted` = true
    - `terms_accepted_version` = `terms_version`
    - `terms_accepted_at` = 現在時刻
  - `terms_agreed` が `false` または未指定の場合の扱い（登録エラーにするか、ゲスト扱いにするか）は要件に応じて別途定義する。

- `POST   /auth/login`  
  - メールアドレス + パスワードでログイン

- `POST   /auth/logout`  
  - ログアウト（Refresh Token を無効化）

- `POST   /auth/refresh`  
  - Refresh Token を使って新しい Access Token を発行

- `POST   /auth/password/forgot`  
  - パスワードリセット用メール送信

- `POST   /auth/password/reset`  
  - 新しいパスワードを設定

- `POST   /auth/verify-email`  
  - メール認証コードの検証

- `POST   /auth/line/login`  
  - LINE ログイン用コールバック（アクセストークン/IDトークンを受け取り、ユーザーを作成 or ログイン）

- `POST   /auth/google/login`  
  - Google ログイン用コールバック

---

## 2. ユーザー / マイページ

- `GET    /users/me`  
  - 自分のプロフィール情報を取得（マイページ上部に表示）

- `PUT    /users/me`  
  - 自分のプロフィールを更新（ニックネームなど）

- `GET    /users/me/posts`  
  - 自分が投稿した記事一覧を取得（「自分の投稿」画面用）

- `DELETE /users/me`  
  - 退会処理（アカウント削除）

---

## 3. ラウンジ (Lounge)

- `GET    /lounges`  
  - ホーム画面に表示するラウンジカード一覧  
  - 必要に応じて `?q=キーワード` でラウンジ名検索も想定

- `GET    /lounges/recent`  
  - 最近閲覧したラウンジ一覧（最新 N 件、例: 6〜18 件）  
  - `lounge_recent_views` と `lounges` を JOIN して取得

- `GET    /lounges/{lounge_id}`  
  - 特定ラウンジの詳細情報（名前、説明、サムネイル画像など）

- `GET    /lounges/{lounge_id}/posts`  
  - そのラウンジ内の投稿一覧 + 検索  
  - クエリパラメータ:
    - `q`      : 検索キーワード（未指定なら全件）
    - `target` : `title` \| `content` \| `author` （タイトル / 内容 / 作成者）
    - `sort`   : `created_at_asc` \| `created_at_desc` （登録順 / 新着順）※必要に応じて

---

## 4. 投稿 (Post)

- `GET    /posts/{post_id}`  
  - 投稿詳細を取得

- `POST   /posts`  
  - ログインユーザーによる投稿作成  
  - `multipart/form-data` でタイトル・本文・画像(最大 10 枚)をまとめて送信

- `POST   /posts/guest`  
  - ゲストによる投稿作成（ニックネーム + パスワード + 画像）  
  - こちらも `multipart/form-data` で送信

- `PUT    /posts/{post_id}`  
  - 投稿本文の修正（作成者のみ）

- `DELETE /posts/{post_id}`  
  - 投稿削除（作成者 or 管理者）  
  - `best_posts` は `ON DELETE CASCADE` で自動削除される想定

- `POST   /posts/{post_id}/like`  
  - いいね（おすすめ）  
  - 初回のみ `like_count` を +1 し、閾値以上になった場合は `best_posts` に登録

- `POST   /posts/{post_id}/dislike`  
  - よくないね（非推薦）

- `GET    /posts/best?limit=N`  
  - ベスト投稿一覧（全ラウンジ共通）  
  - `best_posts` と `posts` を JOIN し、`like_count DESC, created_at DESC` で最大 N 件取得  
  - レスポンスには少なくとも `id`, `title`, `created_at` を含める

※ 画像の追加・削除 API（編集時用）は後続フェーズで検討:  
- `POST   /posts/{post_id}/images`  
- `DELETE /posts/{post_id}/images/{image_id}`

---

## 5. コメント / 返信 (Comment)

- `GET    /posts/{post_id}/comments?sort=created_at_asc|created_at_desc`  
  - 指定投稿に対するコメント + 大コメント一覧  
  - `parent_comment_id` を使ってツリー構造（一段階の返信）を表現

- `POST   /posts/{post_id}/comments`  
  - ログインユーザーによるコメント・返信作成  
  - リクエストボディ:
    - `content`
    - `parent_comment_id`（通常コメントなら `null`、返信なら親コメント ID）

- `POST   /posts/{post_id}/comments/guest`  
  - ゲストによるコメント・返信作成（ニックネーム + パスワード）

- `DELETE /comments/{comment_id}`  
  - コメント削除（作成者 or ゲスト + パスワード一致）  
  - 実際には行を物理削除せず、`is_deleted = true` として  
    「削除されたコメントです」という表示にする。返信コメントは残す。

---

## 6. 通知 (Notification)

- `GET    /notifications`  
  - 自分宛ての通知一覧を取得  
  - 各通知には少なくとも以下を含める:
    - `id`
    - `type` (`comment`, `lounge_approved`, `lounge_rejected` など)
    - `title`
    - `body`
    - `post_id`    （コメント通知の場合）
    - `lounge_id`  （ラウンジ申請結果の場合）
    - `is_read`
    - `created_at`

- `GET    /notifications/unread-count`  
  - 未読通知件数を取得（バッジ表示用）

- `PUT    /notifications/{id}/read`  
  - 通知を既読にする（`is_read = true`）  
  - 画面遷移（投稿詳細／ラウンジ画面への移動）はフロント側で `type` / `post_id` / `lounge_id` を見て制御する。

- `GET    /notification-settings`  
  - 通知設定の取得  
  - 例:
    - `comment_notification_enabled: true/false`
    - `lounge_request_notification_enabled: true/false`

- `PUT    /notification-settings`  
  - 通知設定の更新（コメント通知 / ラウンジ申請結果通知の ON/OFF）

---

## 7. ラウンジ申請 (Lounge Request)

- `POST   /lounge-requests`  
  - ユーザーによるラウンジ作成申請  
  - 内容は `lounge_requests` テーブルに `status = 'pending'` で保存される。  
  - 結果（承認/却下）は通知 (`notifications`) 経由でユーザーに伝える。

---

