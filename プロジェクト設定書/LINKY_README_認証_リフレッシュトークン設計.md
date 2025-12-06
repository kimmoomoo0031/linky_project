## Linky 認証設計: Refresh Token ポリシー

このドキュメントは、Linky プロジェクトにおける **Refresh Token の設計と運用方針** をまとめたものです。  
アクセストークン / リフレッシュトークンの役割分担や、有効期限・保存方法・ログアウト時の挙動を明確にします。

---

## 1. トークンの役割

### 1-1. Access Token

- 役割:
  - 短命な認証トークン。  
  - API リクエストごとに `Authorization: Bearer <access_token>` として送信する。
- 特徴:
  - 有効期限: 約 30 分（例）
  - 期限切れ後は `/auth/refresh` を通じて再取得する。
  - 万が一流出しても、短時間で無効になるように設計する。

### 1-2. Refresh Token

- 役割:
  - ログイン状態を長期間維持するためのトークン。
  - Access Token が期限切れになったときに、再ログインなしで新しい Access Token を発行するために使用する。
- 特徴:
  - 有効期限: 約 2 ヶ月（60 日）とする。
  - サーバー側（DB）で管理し、無効化/期限切れの判定を行う。

---

## 2. 有効期限のポリシー

- **Access Token**
  - 有効期限: 約 30 分
  - 理由:
    - 有効期間を短くすることで、トークンが盗まれた場合の被害を最小限に抑える。

- **Refresh Token**
  - 有効期限: 約 2 ヶ月（60 日）
  - 発行時に `expires_at = now + 60 days` として保存し、これを超えた場合は完全に無効とする。
  - ユーザー体験:
    - 2 ヶ月間は「頻繁に使っている限り」自動リフレッシュでログイン状態を維持できる。
    - 2 ヶ月を超えた場合は再度ログインを要求する。

---

## 3. 保存方法（クライアント / サーバー）

### 3-1. クライアント側（Flutter アプリ）

- 保存するもの:
  - `refresh_token_raw`（生のリフレッシュトークン文字列）
- 保存場所:
  - Flutter Secure Storage など、OS レベルの安全なストレージを使用する。
  - ログ出力や Git に残さない。

### 3-2. サーバー側（DB: PostgreSQL）

- 生の Refresh Token を DB に平文で保存しない。
- 代わりに「ハッシュ値」のみ保存する。

```text
テーブル: refresh_tokens

- id           PK
- user_id      FK(users.id)
- token_hash   ハッシュ化したリフレッシュトークン（例: bcrypt / SHA-256 + salt）
- created_at   作成日時
- expires_at   期限切れ日時（例: now + 60 days）
- revoked      boolean（強制ログアウト/無効化フラグ）
```

- 発行時のフロー:
  1. ログイン成功時に `refresh_token_raw`（十分に長いランダム文字列）を生成。
  2. サーバー側で `token_hash = hash(refresh_token_raw)` を計算。
  3. `refresh_tokens (user_id, token_hash, created_at, expires_at, revoked=false)` を DB に保存。
  4. クライアントには `refresh_token_raw` のみレスポンスとして返す。

- 検証時のフロー（`POST /auth/refresh`）:
  1. クライアントから `refresh_token_raw` を受け取る。
  2. サーバー側で同じハッシュ関数を用いて `candidate_hash = hash(refresh_token_raw)` を計算。
  3. `refresh_tokens` テーブルを `WHERE token_hash = :candidate_hash AND revoked = false` で検索。
  4. レコードが存在しない、または `expires_at` が現在時刻を過ぎている場合は 401/403 を返す。
  5. 有効な場合は新しい Access Token を発行する。
     - 将来的には Refresh Token もローテーションし、旧トークンを `revoked = true` にすることを検討。

---

## 4. ログイン状態維持のフロー

1. **ログイン時**
   - メール/パスワード、またはソーシャルログイン(LINE/Google)に成功。
   - サーバーは Access Token（30 分）と Refresh Token（60 日）を発行。
   - Flutter アプリ:
     - Access Token: メモリ/状態管理で使用。
     - Refresh Token: Secure Storage に保存。

2. **通常の API 呼び出し**
   - Access Token が有効な間は、すべての API リクエストに  
     `Authorization: Bearer <access_token>` ヘッダーを付与して送信。

3. **Access Token 期限切れ**
   - API 呼び出し時に 401/403（トークン期限切れ）を受け取る。
   - Flutter アプリは保存しておいた `refresh_token_raw` を用いて  
     `POST /auth/refresh` を呼び出す。
   - サーバーは DB の `refresh_tokens` を検証し、有効であれば新しい Access Token を発行。
   - ユーザーはログイン画面に戻ることなく、アプリの利用を継続できる。

4. **Refresh Token 期限切れ（60 日経過）**
   - `/auth/refresh` の検証で `expires_at` が現在時刻を過ぎている場合、期限切れと判断。
   - サーバーは 401/403 を返却。
   - Flutter アプリはログイン画面へ遷移し、ユーザーに再ログインを要求する。

---

## 5. ログアウトと強制ログアウト

### 5-1. ユーザーが自発的にログアウトする場合

- クライアント側:
  - Secure Storage に保存している Access Token / Refresh Token を削除。
- サーバー側:
  - 現在のデバイスに対応する `refresh_tokens` レコードを特定し、`revoked = true` に更新。

### 5-2. セキュリティインシデント / アカウント乗っ取りが疑われる場合

- サーバー側:
  - 対象ユーザーの `user_id` に紐づく `refresh_tokens` をすべて `revoked = true` に更新。
  - 以降、そのユーザーの `/auth/refresh` はすべて失敗し、再ログインが必須となる。

---

## 6. Access Token (JWT) との関係

- Access Token は JWT フォーマットで発行し、以下のようなクレームを含める想定とする。

```json5
{
  "sub": 123,              // ユーザー ID (users.id)
  "role": "user",          // "user" | "admin" | "guest"
  "is_guest": false,
  "jti": "uuid-...",       // トークン固有 ID
  "iat": 1719990000,       // 発行時刻
  "exp": 1719991800,       // 期限 (例: 30 分)
  "iss": "linky-api",      // 発行者
  "aud": "linky-mobile"    // 対象(クライアント)
}
```

- Refresh Token は必ずしも JWT 形式である必要はなく、**十分に長いランダム文字列**とし、  
  DB 側ではハッシュ値 + 期限 + 状態(`revoked`)で管理する。

---

## 7. まとめ

- Access Token:
  - 短命 (約 30 分)、API 認証用、JWT フォーマット。
- Refresh Token:
  - 長命 (約 60 日)、ログイン状態維持用。
  - クライアントでは Secure Storage に平文保存。
  - サーバーではハッシュ値として `refresh_tokens` テーブルに保存し、期限と `revoked` フラグで管理。
- ユーザー体験:
  - 通常利用では頻繁な再ログインを要求せず、2 ヶ月ごとに再ログインが必要なイメージ。
- セキュリティ:
  - DB 漏洩時にも平文 Refresh Token が漏れないようにハッシュ化。
  - 強制ログアウトが必要な場合は `revoked` を利用してサーバー側からセッションを無効化可能。


