## Linky フロントエンド 技術スタック

Linky アプリのフロントエンド（Flutter）で使用する **技術スタック一覧** です。  
1人開発 + ポートフォリオ + 本番デプロイを想定し、拡張性と実装コストのバランスを取った構成になっています。

---

## 1. ベース

- **フレームワーク**: Flutter
- **言語**: Dart
- **ターゲット**: iOS / Android

---

## 2. アーキテクチャ / 状態管理

- **アーキテクチャスタイル**
  - クリーンアーキテクチャ
    - レイヤ構成: `data / domain / presentation`
    - 機能ごとの feature 分割: `auth`, `lounge`, `post`, `comment`, `notification`, `lounge_request` など

- **状態管理**
  - `flutter_riverpod`
    - Provider / StateNotifier / AsyncNotifier を用いて状態管理と DI を統一
    - Repository, UseCase, Controller なども Riverpod の Provider で注入

- **ルーティング**
  - `go_router`
    - 画面遷移とタブナビゲーション
    - ログイン必須ページのガードやディープリンク対応を想定

---

## 3. モデル / コード生成

- `freezed`
- `freezed_annotation`
- `json_serializable`
- `build_runner`

用途:

- 不変クラス（DTO / エンティティ）の自動生成
  - `copyWith`, `==`, `hashCode` など
- JSON ⇔ Dart 変換コード（`fromJson`, `toJson`）の自動生成

---

## 4. ネットワーク / API 通信

- **HTTP クライアント**
  - `dio`
    - タイムアウト, 共通ヘッダ, ログ出力 などを集中管理

- **API クライアント自動生成**
  - `retrofit` (for Dart)
    - `@RestApi()` アノテーションでインターフェイス定義
    - 例: `AuthApi`, `PostApi`, `LoungeApi`, `CommentApi`, `NotificationApi` …
    - 実装は `build_runner` により自動生成

- **共通インターセプタ (予定)**
  - Access Token 自動付与（`Authorization: Bearer ...`）
  - リクエスト/レスポンスのログ出力
  - エラー時の共通ハンドリング

---

## 5. 環境設定 / ユーティリティ

- `flutter_dotenv`
  - `.env` ファイルから API Base URL など環境ごとの設定を読み込む
  - 例: `DEV_API_BASE_URL`, `PROD_API_BASE_URL`

- `intl`
  - 日付フォーマット（例: `2025/10/16` 表示）

- `logger`
  - デバッグログ出力用

---

## 6. この構成での開発の進め方（簡易メモ）

1. `pubspec.yaml` に上記ライブラリを追加  
2. `dio` + `retrofit` で `AuthApi` をまず定義し、`/auth/user`, `/users/me` を叩けるようにする  
3. `freezed` + `json_serializable` で DTO を定義し、API レスポンスとマッピング  
4. `auth` feature で
   - `data` / `domain` / `presentation` レイヤを一通り実装  
   - Riverpod でログイン状態管理
5. パターンが固まったら、`lounge`, `post`, `comment`, `notification` など他の feature に横展開する。


