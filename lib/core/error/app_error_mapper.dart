import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'api_error_models.dart';
import 'app_error.dart';

/// [Core/Error] 例外（DioException 等）を AppError に正規化する責務を集約する。
class AppErrorMapper {
  const AppErrorMapper._();

  /// [Core/Error] 任意の例外を AppError に変換する（単一の入口）。
  static AppError from(Object error) {
    // Dio
    if (error is DioException) {
      final api = ApiErrorResponse.tryParse(error.response?.data);
      if (api != null) {
        return AppErrorApi(
          traceId: api.traceId,
          httpStatus: error.response?.statusCode,
          code: api.error.code,
          message: api.error.message,
          type: api.error.type,
          details: api.error.details,
          path: api.path,
          method: api.method,
        );
      }
      return _fromDio(error);
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

  static AppError _fromDio(DioException e) {
    final code = e.response?.statusCode;

    // type 優先（timeout 等）
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppErrorTimeout();
      case DioExceptionType.connectionError:
        return const AppErrorNetwork();
      case DioExceptionType.badResponse:
        // status code で大分類
        if (code == 401 || code == 403) {
          return const AppErrorUnauthorized();
        }
        if (code != null && code >= 500) {
          return AppErrorServer(statusCode: code);
        }
        if (code != null && code >= 400) {
          return AppErrorBadRequest(statusCode: code);
        }
        return AppErrorUnknown(e);
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return AppErrorUnknown(e);
    }
  }
}


