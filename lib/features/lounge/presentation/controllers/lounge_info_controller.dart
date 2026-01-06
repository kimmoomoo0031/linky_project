import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ラウンジ情報画面向けの表示データ（モック）。
class LoungeInfoViewData {
  const LoungeInfoViewData({
    required this.loungeId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.totalPostCount,
    this.coverImageUrl,
  });

  final int loungeId;
  final String title;
  final String description;
  final DateTime createdAt;
  final int totalPostCount;

  /// ラウンジのカバー画像URL（S3など）。未登録の場合は null。
  final String? coverImageUrl;
}

/// ラウンジ情報取得コントローラ（モック）。
///
/// TODO(api): 実API接続後は Repository 経由で取得する。
class LoungeInfoController extends FamilyAsyncNotifier<LoungeInfoViewData, int> {
  @override
  Future<LoungeInfoViewData> build(int loungeId) async {
    // モック：少し待ってローディングを見せる
    await Future<void>.delayed(const Duration(milliseconds: 250));

    // モックの可変値（ラウンジIDによって見た目/数値が変わるようにする）
    final base = loungeId.abs();
    final createdAt = DateTime(2025, 8, 14).subtract(Duration(days: base % 365));
    final totalPostCount = 120000 + (base % 9000);

    return LoungeInfoViewData(
      loungeId: loungeId,
      title: base % 7 == 0 ? '日本生活' : 'ラウンジ（モック）#$loungeId',
      description: '内容です内容です内容です内容です内容です内容です内容です内容です内容です内容です',
      createdAt: createdAt,
      totalPostCount: totalPostCount,
      // 未登録想定：null のときはUI側でデフォルト画像へフォールバックする
      coverImageUrl: null,
    );
  }
}

final loungeInfoControllerProvider = AsyncNotifierProviderFamily<
    LoungeInfoController, LoungeInfoViewData, int>(LoungeInfoController.new);


