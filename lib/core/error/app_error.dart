import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// アプリ内で扱う「標準化したエラー」。
///
/// 目的:
/// - 例外（DioException 等）を UI に直接流さない
/// - UI は「ユーザー向け文言」だけを表示する
/// - 実 API 連携後も、エラー種別追加はここ（変換/マッピング）だけで済むようにする
sealed class AppError {
  const AppError();

  factory AppError.from(Object error) {
    // Dio
    if (error is DioException) {
      return AppErrorDio._from(error);
    }

    // ネットワーク（Socket）
    if (error is SocketException) {
      return const AppErrorNetwork();
    }

    // タイムアウト（Dart）
    if (error is TimeoutException) {
      return const AppErrorTimeout();
    }

    // 形式不正など
    if (error is FormatException) {
      return const AppErrorInvalidResponse();
    }

    return AppErrorUnknown(error);
  }

  /// ユーザー向けの表示文言（例外の生文は出さない）。
  ///
  /// - [contextLabel] は画面/機能に応じた補足（例: 通知/ホーム/検索）に使う
  String userMessage({String? contextLabel});
}

/// ネットワーク未接続/接続不可。
class AppErrorNetwork extends AppError {
  const AppErrorNetwork();

  @override
  String userMessage({String? contextLabel}) {
    return 'ネットワーク接続を確認してください。';
  }
}

/// 通信がタイムアウト。
class AppErrorTimeout extends AppError {
  const AppErrorTimeout();

  @override
  String userMessage({String? contextLabel}) {
    return '通信がタイムアウトしました。時間をおいて再度お試しください。';
  }
}

/// 返却データが不正（JSON 形式不正など）。
class AppErrorInvalidResponse extends AppError {
  const AppErrorInvalidResponse();

  @override
  String userMessage({String? contextLabel}) {
    final prefix = (contextLabel == null || contextLabel.isEmpty)
        ? ''
        : '$contextLabelの';
    return '${prefix}データの取得に失敗しました。';
  }
}

/// 認証/権限（401/403 等）。
class AppErrorUnauthorized extends AppError {
  const AppErrorUnauthorized();

  @override
  String userMessage({String? contextLabel}) {
    return 'セッションが切れました。再ログインしてください。';
  }
}

/// サーバー側エラー（5xx 等）。
class AppErrorServer extends AppError {
  const AppErrorServer({this.statusCode});

  final int? statusCode;

  @override
  String userMessage({String? contextLabel}) {
    return 'サーバーエラーが発生しました。しばらくしてからお試しください。';
  }
}

/// リクエスト不正/クライアントエラー（4xx）。
class AppErrorBadRequest extends AppError {
  const AppErrorBadRequest({this.statusCode});

  final int? statusCode;

  @override
  String userMessage({String? contextLabel}) {
    final prefix = (contextLabel == null || contextLabel.isEmpty)
        ? ''
        : '$contextLabelの';
    return '${prefix}取得に失敗しました。';
  }
}

/// 不明なエラー。
class AppErrorUnknown extends AppError {
  const AppErrorUnknown(this.original);

  final Object original;

  @override
  String userMessage({String? contextLabel}) {
    final prefix = (contextLabel == null || contextLabel.isEmpty)
        ? ''
        : '$contextLabelの';
    return '${prefix}取得に失敗しました。';
  }
}

class AppErrorDio extends AppError {
  const AppErrorDio._(this.type, {this.statusCode});

  final DioExceptionType type;
  final int? statusCode;

  factory AppErrorDio._from(DioException e) {
    final code = e.response?.statusCode;

    // type 優先（timeout 等）
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppErrorDio._(DioExceptionType.receiveTimeout);
      case DioExceptionType.connectionError:
        return const AppErrorDio._(DioExceptionType.connectionError);
      case DioExceptionType.badResponse:
        // status code で大分類
        if (code == 401 || code == 403) {
          return const AppErrorDio._(DioExceptionType.badResponse, statusCode: 401);
        }
        return AppErrorDio._(DioExceptionType.badResponse, statusCode: code);
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return AppErrorDio._(e.type, statusCode: code);
    }
  }

  @override
  String userMessage({String? contextLabel}) {
    // timeout
    if (type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return const AppErrorTimeout().userMessage(contextLabel: contextLabel);
    }
    // network
    if (type == DioExceptionType.connectionError) {
      return const AppErrorNetwork().userMessage(contextLabel: contextLabel);
    }

    final code = statusCode;
    if (code == 401 || code == 403) {
      return const AppErrorUnauthorized().userMessage(contextLabel: contextLabel);
    }
    if (code != null && code >= 500) {
      return AppErrorServer(statusCode: code).userMessage(contextLabel: contextLabel);
    }
    if (code != null && code >= 400) {
      return AppErrorBadRequest(statusCode: code).userMessage(contextLabel: contextLabel);
    }

    return AppErrorUnknown(this).userMessage(contextLabel: contextLabel);
  }
}


