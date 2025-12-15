import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_log.dart';
import 'trace_id.dart';

/// Riverpod の状態変更をグローバルに観測する開発用 Observer。
///
/// - デバッグモードでのみ動作
/// - 必要に応じて providerName フィルタを追加してログ量を抑えられる
class RiverpodDebugObserver extends ProviderObserver {
  const RiverpodDebugObserver({
    this.nameFilter,
  });

  /// true を返した provider のみログ出力。
  /// null の場合は全て出力。
  final bool Function(String providerName)? nameFilter;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (!kDebugMode) return;
    final providerName = provider.name ?? provider.runtimeType.toString();
    if (nameFilter != null && !nameFilter!(providerName)) return;
    AppLog.state(providerName: providerName, previous: previousValue, next: newValue);
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (!kDebugMode) return;
    final providerName = provider.name ?? provider.runtimeType.toString();
    if (nameFilter != null && !nameFilter!(providerName)) return;
    AppLog.err(
      feature: 'STATE',
      action: providerName,
      traceId: TraceId.newId(),
      ms: 0,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
