## Linky バックエンド アーキテクチャ & 技術スタック設計メモ

このドキュメントは、Linky プロジェクトの **バックエンド全体構成(アーキテクチャ)** と  
使用する **技術スタック** をまとめた設計用 README です。

---

## 1. 全体アーキテクチャ概要

### 1-1. 全体構成

- クライアント
  - Flutter アプリ（iOS / Android）
  - REST API + JSON でバックエンドと通信

- バックエンド
  - フレームワーク: FastAPI (Python 3.13.7 利用)
  - アーキテクチャ: モノリシック構成  
    （1つの FastAPI プロジェクト内で機能ごとにモジュール分割）
  - レイヤード構造
    - `entity` : ドメインエンティティ（本プロジェクトでは SQLAlchemy モデル = エンティティとみなす）
    - `models` : SQLAlchemy モデル定義（= DB テーブル構造 & エンティティ）
    - `repository` : DB アクセス（SQLAlchemy を用いた CRUD / 検索）
    - `service` : ビジネスロジック（ドメインルール、複数リポジトリや外部サービスの組み合わせ）
    - `router` : HTTP エンドポイント定義（API の入り口、Pydantic スキーマとのバインディング）
    - `schemas` : Pydantic ベースのリクエスト/レスポンス DTO（入力検証・レスポンス整形）

- インフラ / 外部サービス
  - AWS EC2: FastAPI アプリケーションをホスト
  - AWS RDS (PostgreSQL): 永続データ保存
  - AWS S3: 投稿画像ファイルの保存（最大 10 枚/投稿）
  - Firebase FCM: プッシュ通知（コメント通知 / ラウンジ申請結果通知）
  - Route 53: ドメイン管理
  - Let’s Encrypt: 無料 SSL 証明書発行（HTTPS 対応）

---

### 1-2. リクエストの流れ（テキスト図）

1. ユーザーの Flutter アプリから HTTP(S) リクエスト送信  
   例: `https://api.example-linky.com/api/v1/posts`

2. Route 53 で `api.example-linky.com` を EC2 の Nginx にルーティング

3. Nginx
   - 80番ポート (HTTP) → 443 番 (HTTPS) へリダイレクト
   - 443 番ポートで SSL 終端（Let’s Encrypt）
   - バックエンド(Uvicorn) へリバースプロキシ  
     `proxy_pass http://127.0.0.1:8000;`

4. Uvicorn
   - FastAPI アプリケーション実行
   - ルーター → サービス → リポジトリ → DB/S3/FCM の順で処理

5. データアクセス
   - 認証 / 投稿 / コメント / ラウンジ / 通知 など: RDS(PostgreSQL)
   - 画像ファイル: S3 にアップロード（DB には URL のみ保存）
   - プッシュ通知: FCM 経由で送信

---

## 2. バックエンド構成（ディレクトリ/モジュール）

※ 実際の実装時に微調整する可能性あり

```text
app/
  main.py                    # FastAPI エントリーポイント

  core/                      # 共通設定・基盤
    config.py                # 設定値（環境変数読み込み）
    database.py              # DB 接続（SQLAlchemy + PostgreSQL）
    security.py              # JWT, パスワードハッシュ等
    dependencies.py          # 共通依存関係（認証ユーザー取得など）

  auth/                      # 認証・認可
    models/                  # User モデル 等
    schemas/                 # 認証関連スキーマ
    router/                  # /auth/... エンドポイント
    service/                 # ログイン/登録/トークン発行ロジック
    repository/              # User 取得・作成など DB 操作
    oauth/                   # LINE / Google OAuth2 ロジック

  user/                      # マイページ / プロフィール
    ...

  lounge/                    # ラウンジ一覧・詳細・お気に入り・最近閲覧
    ...

  post/                      # 投稿（記事）
    ...

  comment/                   # コメント
    ...

  notification/              # 通知（DB + FCM）
    ...

  lounge_request/            # ラウンジ申請（ユーザー・管理者）
    ...

  admin/                     # 管理者向け API
    ...

  utils/                     # S3 アップローダー等のユーティリティ
    s3_uploader.py
```

---

## 3. 技術スタック一覧

### 3-1. 言語 / フレームワーク

- 言語: Python 3.13.7（開発環境）
- Web フレームワーク: FastAPI
- ASGI サーバー: Uvicorn
- ORM: SQLAlchemy
- マイグレーションツール: Alembic

---

### 3-2. 認証・セキュリティ

- 認証方式: JWT + Refresh Token
  - Access Token
    - 有効期限: 短め（例: 30 分）
    - API リクエストごとに `Authorization: Bearer <token>` で送信
  - Refresh Token
    - 有効期限: 長め（例: 7 日）
    - **DB には平文ではなくハッシュ値として保存する**
      - 例: `refresh_tokens (id, user_id, token_hash, created_at, expires_at, revoked)`
      - クライアントには生のトークン文字列を返し、サーバー側は検証時に同じアルゴリズムでハッシュして比較する
    - 将来的には Refresh Token ローテーション（再発行時に旧トークンを無効化）も検討
  - JWT ペイロード例:
    - `sub`（ユーザー ID）
    - `role`（`user` / `admin` / `guest`）
    - `is_guest`
    - `exp`（有効期限）
    - `jti`（トークン固有 ID）

- JWT ライブラリ
  - `python-jose[cryptography]`

- パスワードハッシュ
  - `passlib[bcrypt]` を利用し、平文パスワードは保存しない

- ソーシャルログイン
  - LINE / Google
  - ライブラリ: `authlib` + `httpx`
  - `users` テーブルの `provider` / `provider_user_id` で外部アカウントと紐付け
   - ID トークンの署名・`iss`・`aud`・`exp` などを検証してからログイン処理を行う
   - 同一メールアドレスでの「メール登録アカウント」と「ソーシャルアカウント」をどう扱うかは、  
     初期段階では「別アカウントとして扱う」方針とし、将来的な統合ポリシーを検討する

- 権限管理
  - `role`: `user` / `admin` / `guest` を `users` テーブルと JWT ペイロードに保持
  - 管理者専用エンドポイントでは `role == 'admin'` をチェック

---

### 3-3. データベース

- RDBMS: PostgreSQL
  - 開発環境: ローカル PostgreSQL
  - 本番環境: AWS RDS PostgreSQL

- スキーマ管理
  - SQLAlchemy モデル + Alembic によるマイグレーション
  - テーブル例:
    - `users`（ユーザーアカウント）
    - `posts`（投稿）
    - `post_images`（投稿画像の S3 URL）
    - `comments`（コメント）
    - `lounges` / `lounge_favorites` / `lounge_recent_views`
    - `lounge_requests`（ラウンジ申請）
    - `notifications`（通知）
    - `user_notification_settings`（通知設定）
    - `refresh_tokens`（リフレッシュトークン管理）

---

### 3-4. ファイルストレージ

- サービス: AWS S3
  - 投稿画像を S3 バケットに保存
  - DB には画像の URL のみ保存
  - 投稿 1 件あたり最大 10 枚まで
- ライブラリ: `boto3`

---

### 3-5. 通知

- サービス: Firebase Cloud Messaging (FCM)
  - ライブラリ: `firebase-admin`
  - 機能:
    - 自分の投稿にコメントがついたときの通知
    - 自分のラウンジ申請が承認/却下されたときの通知
  - `user_fcm_tokens` テーブルなどに FCM トークンを保存し、バックエンドから FCM 経由でプッシュ送信
  - 送信時に FCM から「トークン無効/期限切れ」レスポンスを受け取った場合は、該当トークンを DB から削除しクリーンアップする

---

## 4. インフラ / デプロイ構成

- クラウド: AWS

- コンピュート
  - AWS EC2（Ubuntu, t2.micro 想定）
  - FastAPI(Uvicorn) を常駐プロセスとして稼働（systemd など）
  - EC2 には最小権限の IAM ロールを付与し、必要なリソース（例: S3 アップロード, Parameter Store 参照）のみ許可する

- データベース
  - AWS RDS PostgreSQL
  - パブリックアクセスは無効化し、EC2 など特定のセキュリティグループからのみ接続を許可する

- ストレージ
  - AWS S3（画像アップロード用）

- ネットワーク / ドメイン / HTTPS
  - Route 53
    - 独自ドメイン管理
    - 例: `api.linky-example.com` → EC2 の Nginx に A レコード設定
  - Nginx
    - 80 番ポート: HTTP → 443 番へリダイレクト
    - 443 番ポート: HTTPS 終端、Uvicorn へのリバースプロキシ
  - Let’s Encrypt
    - `certbot` による無料 SSL 証明書発行と自動更新設定
  - 機密情報（DB パスワード, JWT シークレットなど）は Git にコミットせず、  
    本番環境では AWS Systems Manager Parameter Store / Secrets Manager から取得する

---

## 5. 開発フロー（概要）

### 5-1. ローカル開発

1. Python 3.13.7 環境構築（venv など）
2. `pip install -r requirements.txt` で依存ライブラリ導入
3. ローカル PostgreSQL を起動し、`.env` で接続情報設定
4. Alembic による初期マイグレーション実行（テーブル作成）
5. `uvicorn app.main:app --reload` で開発用サーバー起動
6. `http://localhost:8000/docs`（Swagger UI）で API 動作確認

### 5-2. 本番デプロイ（手動デプロイの想定）

1. AWS EC2 インスタンス作成（Ubuntu）
2. Python / Git / Nginx / PostgreSQL クライアントなどをインストール
3. RDS / S3 / Route 53 / SSL 設定
4. プロジェクトを EC2 に配置（git clone など）
5. 仮想環境作成 & `pip install -r requirements.txt`
6. Alembic マイグレーションを RDS に対して実行
7. Uvicorn を systemd サービスとして登録し常駐起動
8. Nginx のリバースプロキシ & HTTPS 設定
9. Flutter アプリから本番 API エンドポイントに接続して動作確認

---

## 6. メモ

- Python バージョン: 3.13.7（開発環境）  
  → ライブラリは 3.13 系で動作確認しつつ導入する。
- 将来的にトラフィックや機能が増えた場合は、ECS/Fargate や CI/CD 導入なども検討可能だが、  
  現段階では「学習・ポートフォリオ用途 + シンプルな運用」を優先し EC2 単体構成とする。


