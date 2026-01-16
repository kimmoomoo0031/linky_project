import 'package:flutter/foundation.dart';
import 'package:linky_project_0318/core/error/api_error_models.dart';
import 'package:linky_project_0318/core/error/app_error_mapper.dart';

/// [Core/Error] ユーザー向けエラーメッセージ生成時に使う「画面/機能」コンテキスト。
enum AppErrorContext {
  notifications,
  notificationSettings,
  home,
  myPosts,
  loungeSearch,
  loungeMain,
}

extension AppErrorContextLabel on AppErrorContext {
  /// [Core/Error] 画面/機能を表す表示ラベル（日本語）。
  String get label => switch (this) {
    AppErrorContext.notifications => '通知',
    AppErrorContext.notificationSettings => '通知設定',
    AppErrorContext.home => 'ホーム',
    AppErrorContext.myPosts => '投稿',
    AppErrorContext.loungeSearch => '検索',
    AppErrorContext.loungeMain => 'ラウンジ',
  };
}


sealed class AppError {
  const AppError();

  factory AppError.from(Object error) {
    return AppErrorMapper.from(error);
  }
  /// - [context] は画面/機能に応じた補足（例: 通知/ホーム/検索）に使う
  String userMessage({AppErrorContext? context});
}

/// [Core/Error] サーバー標準のエラー応答（trace_id/error/path/method）を表す AppError。
class AppErrorApi extends AppError {
  const AppErrorApi({
    required this.traceId,
    required this.httpStatus,
    required this.code,
    required this.message,
    required this.type,
    required this.details,
    required this.path,
    required this.method,
  });

  /// [Core/Error] サーバー trace_id（ログ追跡用）
  final String traceId;

  /// [Core/Error] HTTP status（成功定義は200、ここは失敗時のみ来る想定）
  final int? httpStatus;

  /// [Core/Error] ビジネスエラーコード（例: 1000台/2000台）
  final int code;

  /// [Core/Error] ユーザー向けメッセージ（サーバー提供）
  final String message;

  /// [Core/Error] エラータイプ（例: validation_error/internal_error 等）
  final String type;

  /// [Core/Error] Validation詳細（該当時のみ）
  final List<ApiErrorDetail> details;

  final String path;
  final String method;

  @override
  String userMessage({AppErrorContext? context}) {
    if (kReleaseMode) {
      return message.isNotEmpty ? message : 'エラーが発生しました。';
    }
    return '[${type}] $message';
  }
}

/// ネットワーク未接続/接続不可。
class AppErrorNetwork extends AppError {
  const AppErrorNetwork();

  @override
  String userMessage({AppErrorContext? context}) {
    return 'ネットワーク接続を確認してください。';
  }
}

/// 通信がタイムアウト。
class AppErrorTimeout extends AppError {
  const AppErrorTimeout();

  @override
  String userMessage({AppErrorContext? context}) {
    return '通信がタイムアウトしました。時間をおいて再度お試しください。';
  }
}

/// 返却データが不正（JSON 形式不正など）。
class AppErrorInvalidResponse extends AppError {
  const AppErrorInvalidResponse();

  @override
  String userMessage({AppErrorContext? context}) {
    final prefix = _contextPrefix(context);
    return '${prefix}取得したデータの形式が正しくありません。';
  }
}

/// 認証/権限（401/403 等）。
class AppErrorUnauthorized extends AppError {
  const AppErrorUnauthorized();

  @override
  String userMessage({AppErrorContext? context}) {
    return 'セッションが切れました。再ログインしてください。';
  }
}

/// サーバー側エラー（5xx 等）。
class AppErrorServer extends AppError {
  const AppErrorServer({this.statusCode});

  final int? statusCode;

  @override
  String userMessage({AppErrorContext? context}) {
    return 'サーバーエラーが発生しました。しばらくしてからお試しください。';
  }
}

/// リクエスト不正/クライアントエラー（4xx）。
class AppErrorBadRequest extends AppError {
  const AppErrorBadRequest({this.statusCode});

  final int? statusCode;

  @override
  String userMessage({AppErrorContext? context}) {
    final prefix = _contextPrefix(context);
    return '${prefix}入力内容をご確認ください。';
  }
}

/// 不明なエラー。
class AppErrorUnknown extends AppError {
  const AppErrorUnknown(this.original);

  final Object original;

  @override
  String userMessage({AppErrorContext? context}) {
    return '予期せぬエラーが発生しました。しばらくしてからお試しください。';
  }
}

String _contextPrefix(AppErrorContext? context) {
  if (context == null) return '';
  return '${context.label}の';
}


