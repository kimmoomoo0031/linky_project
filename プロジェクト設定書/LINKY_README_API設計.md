## Linky バックエンド API 設計（エンドポイント一覧）

このドキュメントは、Linky プロジェクトのバックエンド API エンドポイントを整理した README です。  
画面仕様（Figma）と機能一覧をもとに、最小限必要な API をまとめています。

---

## 0. 共通方針（命名 / エラー / セキュリティ）

- 命名規約（例）:
  - リソース一覧: 複数形（例: `/notifications`, `/lounges`, `/posts`）
  - 設定: 単数形（例: `/notification-settings`）
- エラーコード（例）:
  - `400`: validation error（必須不足/形式不正など）
  - `401`: unauthorized（未ログイン/トークン無効）
  - `403`: forbidden（権限不足）
  - `404`: not found
  - `422`: business logic error（要件上の拒否: temp 期限切れ等）

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

    "terms_accepted": true,
    "terms_version": "2025-01-01"
  }
  ```

  - `terms_accepted` : 利用規約に同意した場合は `true`。未同意なら `false` またはフィールド自体を送信しない。
  - `terms_version` : 同意時点の利用規約バージョンまたは施行日（例: `"2025-01-01"`）。クライアント側の定数 `currentTermsVersion` と一致させる。

  **サーバー側の想定挙動**

  - `terms_accepted == true` の場合、ユーザーレコードに以下を保存する:
    - `terms_accepted` = true
    - `terms_accepted_version` = `terms_version`
    - `terms_accepted_at` = 現在時刻
  - `terms_accepted` が `false` または未指定の場合の扱い（登録エラーにするか、ゲスト扱いにするか）は要件に応じて別途定義する。

- `POST   /auth/user`  
  - メールアドレス + パスワードでログイン（会員）

- `POST   /auth/guest`  
  - ゲストログイン（Access Token のみ発行）

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
  - 認証: **必須（ログインユーザーのみ）**
    - ゲストは `401`（または空配列を返す等のポリシーは後続で決定）

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

### 4-0. 本文フォーマット & 本文内画像（HTML + 先行アップロード）

- 本文は **HTML 形式**（`content_html`）で保存/送信する。
- 本文内の画像は `<img>` タグで表現する（本文の任意位置に挿入できる）。
- クライアントは画像サイズ変更などの見た目調整を `style` もしくは `width/height` に反映して良い。
  - サーバーは必要に応じて許可する属性/スタイルをホワイトリストで制御する（後続フェーズで検討）。
- 本文編集中に画像を即時表示するため、画像は **先行アップロード（temp）** を行い、本文は **参照値（URL/ID）** を保持する。

#### XSS 対策（HTML sanitize）

- サーバーは `content_html` を **sanitize** して保存/配信する（必須）。
  - 許可タグ例: `p`, `br`, `img`, `strong`, `em`, `ul`, `ol`, `li`
  - 許可属性例: `src`, `alt`, `width`, `height`, `style`（一部のみ許可）
  - 禁止: `script`, `iframe`, `object`、および `onClick` 等の `on*` 属性

本文に挿入する `<img>` 例（推奨）:

```html
<img src="TEMP_URL" data-temp-id="TEMP_IMAGE_ID" style="width:240px;height:auto;" />
```

- `data-temp-id` を本文に埋め込むことで、登録時にサーバーが temp 画像を確実に特定して finalize できる。

- `GET    /posts/{post_id}`  
  - 投稿詳細を取得

- `POST   /uploads/images/temp`  
  - 投稿本文に挿入するための **画像を先行アップロード（temp）** する
  - `multipart/form-data` で送信
  - サーバーは `temp/` 領域に保存し、必要に応じてサイズ/形式の正規化を行う
  - レスポンスで `temp_image_id` と `temp_url`（プレビュー用）を返す
  - 一定時間（例: 24 時間）以内に finalize されない temp 画像は削除される（後述 cleanup）
  - 制限（例）:
    - 1 ユーザーあたり同時保有できる temp 画像は最大 `N` 枚（例: 20）
    - 投稿 1 件あたり本文内画像は最大 10 枚（`POST /posts` と整合）
  - クライアント都合の削除（登録前）:
    - ユーザーが本文から画像を削除した場合、クライアントは **即時の削除 API を呼ばない** 方針とする
    - サーバーは「最終的に `content_html` に残っている `data-temp-id` のみ」を finalize 対象とし、
      本文から削除された temp 画像は finalize されず、cleanup（TTL）で自動削除される

  **Request 例**

  - `file`: image file

  **Response 例**

  ```json
  {
    "temp_image_id": "uuid-...",
    "temp_url": "https://cdn.example.com/temp/uuid-....jpg",
    "expires_at": "2026-02-08T00:00:00Z"
  }
  ```

- `POST   /posts`  
  - ログインユーザーによる投稿作成  
  - **本文内画像は先行アップロード（temp）を前提**とし、この API では画像ファイルを受け取らない
  - リクエストボディ（`application/json`）例:
    - `title`
    - `content_html`（本文内に `<img ... data-temp-id="...">` を含められる）
  - サーバーは `content_html` から `data-temp-id` を抽出し、該当 `temp_image_id` を **finalize（temp→permanent）** する
  - finalize 後、本文内の `src` を **正式 URL** に置換して保存する（推奨）

- `POST   /posts/guest`  
  - ゲストによる投稿作成（ニックネーム + パスワード + 画像）  
  - ゲスト投稿の本文内画像も **先行アップロード（temp）** を前提とし、この API では画像ファイルを受け取らない
  - リクエストボディ（`application/json`）例:
    - `guest_nickname`
    - `guest_password`
    - `title`
    - `content_html`
  - finalize の考え方は `POST /posts` と同様（`data-temp-id` を基準に temp 画像を確定）

- `PUT    /posts/{post_id}`  
  - 投稿本文の修正（作成者のみ）

- `DELETE /posts/{post_id}`  
  - 投稿削除（作成者 or 管理者）  
  - `best_posts` は `ON DELETE CASCADE` で自動削除される想定

- `POST   /posts/{post_id}/like`  
  - いいね（おすすめ）  
  - 初回のみ `like_count` を +1 し、閾値以上になった場合は `best_posts` に登録
  - 仕様（最低限）:
    - 1 ユーザーにつき 1 投稿に 1 リアクション（重複押下は no-op もしくは上書き）
    - `dislike` から `like` への切り替えは上書き（カウント整合はサーバーで担保）

- `POST   /posts/{post_id}/dislike`  
  - よくないね（非推薦）
  - 仕様（最低限）:
    - `like` と同様（1 投稿 1 リアクション、切り替えは上書き）

- `GET    /posts/best?limit=N`  
  - ベスト投稿一覧（全ラウンジ共通）  
  - `best_posts` と `posts` を JOIN し、`like_count DESC, created_at DESC` で最大 N 件取得  
  - レスポンスには少なくとも `id`, `title`, `created_at` を含める

※ 画像の追加・削除 API（編集時用）は後続フェーズで検討:  
- `POST   /posts/{post_id}/images`  
- `DELETE /posts/{post_id}/images/{image_id}`

#### cleanup（未使用 temp 画像の削除）

- 先行アップロードされた temp 画像のうち、一定時間内に投稿登録で参照されず finalize されなかったものは削除する。
- 本文から削除された temp 画像（`data-temp-id` が最終本文に存在しないもの）も同様に cleanup 対象。
- 実装例:
  - S3 の Lifecycle ルールで `temp/` プレフィックス配下を一定期間後に Expiration
  - もしくは DB 管理 + 定期バッチで削除（後続フェーズで検討）

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

