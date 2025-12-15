import 'dart:async';

import 'app_log.dart';
import 'trace_id.dart';

typedef BlockReasonBuilder = String? Function();
typedef FieldsBuilder = Map<String, Object?> Function();

/// REQ/RES/ERR/BLOCK を共通フォーマットで出力しつつ、処理本体を実行する（void版）。
///
/// - 例外は ERR を出したうえで [onException] を呼ぶ
/// - [onException] が未指定の場合のみ、例外は再throw（=隠さない）
Future<void> runLogged({
  required String feature,
  required String action,
  required Map<String, Object?> fields,
  BlockReasonBuilder? blockReason,
  FieldsBuilder? blockFields,
  required Future<void> Function() run,
  FutureOr<void> Function(Object error, StackTrace st)? onException,
}) async {
  final traceId = TraceId.newId();
  final sw = Stopwatch()..start();

  AppLog.req(feature: feature, action: action, traceId: traceId, fields: fields);

  final reason = blockReason?.call();
  if (reason != null) {
    AppLog.block(
      feature: feature,
      action: action,
      traceId: traceId,
      reason: reason,
      fields: blockFields?.call() ?? const {},
    );
    return;
  }

  try {
    await run();
    AppLog.res(feature: feature, action: action, traceId: traceId, ms: sw.elapsedMilliseconds, ok: true);
  } catch (e, st) {
    AppLog.err(
      feature: feature,
      action: action,
      traceId: traceId,
      ms: sw.elapsedMilliseconds,
      error: e,
      stackTrace: st,
    );
    if (onException != null) {
      await onException(e, st);
      return;
    }
    rethrow;
  }
}

/// 戻り値がある処理向けの logged wrapper（値を返す版）。
///
/// - BLOCK の場合は [blockedValue] を返す
/// - 例外は ERR を出し、[onException] があればその戻り値を返す
/// - [onException] が未指定の場合は例外を再throw（=隠さない）
Future<T> runLoggedValue<T>({
  required String feature,
  required String action,
  required Map<String, Object?> fields,
  required T blockedValue,
  BlockReasonBuilder? blockReason,
  FieldsBuilder? blockFields,
  required Future<T> Function() run,
  bool Function(T value)? ok,
  String? Function(T value)? errorCode,
  Map<String, Object?> Function(T value)? resFields,
  FutureOr<T> Function(Object error, StackTrace st)? onException,
}) async {
  final traceId = TraceId.newId();
  final sw = Stopwatch()..start();

  AppLog.req(feature: feature, action: action, traceId: traceId, fields: fields);

  final reason = blockReason?.call();
  if (reason != null) {
    AppLog.block(
      feature: feature,
      action: action,
      traceId: traceId,
      reason: reason,
      fields: blockFields?.call() ?? const {},
    );
    return blockedValue;
  }

  try {
    final value = await run();
    AppLog.res(
      feature: feature,
      action: action,
      traceId: traceId,
      ms: sw.elapsedMilliseconds,
      ok: ok?.call(value) ?? true,
      errorCode: errorCode?.call(value),
      fields: resFields?.call(value) ?? const {},
    );
    return value;
  } catch (e, st) {
    AppLog.err(
      feature: feature,
      action: action,
      traceId: traceId,
      ms: sw.elapsedMilliseconds,
      error: e,
      stackTrace: st,
    );
    if (onException != null) {
      return await onException(e, st);
    }
    rethrow;
  }
}


