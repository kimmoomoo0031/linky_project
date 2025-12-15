import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import 'trace_id.dart';

/// 共通ログフォーマット（REQ/RES/ERR + STATE）を提供するユーティリティ。
///
/// - 現段階では **デバッグモードのみ** 出力
/// - 機密情報（email/code/token/password）は必ずマスキングして渡す前提
class AppLog {
  const AppLog._();

  static void req({
    required String feature,
    required String action,
    required TraceId traceId,
    Map<String, Object?> fields = const {},
  }) {
    _log('[$feature][REQ][$action] trace=${traceId.short()} ${_fmt(fields)}');
  }

  static void res({
    required String feature,
    required String action,
    required TraceId traceId,
    required int ms,
    required bool ok,
    String? errorCode,
    Map<String, Object?> fields = const {},
  }) {
    _log(
      '[$feature][RES][$action] trace=${traceId.short()} ok=$ok'
      '${errorCode != null ? ' error=$errorCode' : ''} ms=$ms ${_fmt(fields)}',
    );
  }

  static void err({
    required String feature,
    required String action,
    required TraceId traceId,
    required int ms,
    required Object error,
    StackTrace? stackTrace,
  }) {
    _log(
      '[$feature][ERR][$action] trace=${traceId.short()} ms=$ms $error',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void block({
    required String feature,
    required String action,
    required TraceId traceId,
    required String reason,
    Map<String, Object?> fields = const {},
  }) {
    _log(
      '[$feature][BLOCK][$action] trace=${traceId.short()} reason=$reason ${_fmt(fields)}',
    );
  }

  static void state({
    required String providerName,
    Object? previous,
    Object? next,
  }) {
    _log('[STATE][$providerName] prev=$previous next=$next');
  }

  /// `a***@domain.com` 形式でマスキング。
  static String maskEmail(String email) {
    final at = email.indexOf('@');
    if (at <= 1) return '***';
    return '${email[0]}***${email.substring(at)}';
  }

  /// トークン/パスワード/認証コード等の機密値をマスキング。
  static String maskSecret([String? _]) => '***';

  static void _log(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;
    developer.log(message.trimRight(), name: 'linky', error: error, stackTrace: stackTrace);
  }

  static String _fmt(Map<String, Object?> fields) {
    if (fields.isEmpty) return '';
    return fields.entries.map((e) => '${e.key}=${e.value}').join(' ');
  }
}


