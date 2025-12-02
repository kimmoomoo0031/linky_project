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
