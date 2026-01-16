/// [Core/Error] バリデーション詳細（details）の1要素。
class ApiErrorDetail {
  const ApiErrorDetail({
    required this.field,
    required this.message,
    required this.type,
  });

  final String field;
  final String message;
  final String type;

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) => ApiErrorDetail(
        field: json['field'] as String? ?? '',
        message: json['message'] as String? ?? '',
        type: json['type'] as String? ?? '',
      );
}

/// [Core/Error] error 本体。
class ApiErrorPayload {
  const ApiErrorPayload({
    required this.code,
    required this.message,
    required this.type,
    required this.details,
  });

  /// [Core/Error] ビジネスエラーコード（例: Auth=1000台, Lounge=2000台）
  final int code;

  /// [Core/Error] ユーザー向けメッセージ（サーバー提供）
  final String message;

  /// [Core/Error] エラータイプ（例: validation_error/internal_error 等）
  final String type;

  /// [Core/Error] Validation詳細（該当時のみ）
  final List<ApiErrorDetail> details;

  factory ApiErrorPayload.fromJson(Map<String, dynamic> json) => ApiErrorPayload(
        code: (json['code'] as num?)?.toInt() ?? -1,
        message: json['message'] as String? ?? 'エラーが発生しました。',
        type: json['type'] as String? ?? 'unknown_error',
        details: (json['details'] as List<dynamic>?)
                ?.whereType<Map>()
                .map((e) => ApiErrorDetail.fromJson(e.cast<String, dynamic>()))
                .toList() ??
            const [],
      );
}

/// [Core/Error] サーバー標準エラー応答（失敗時のみ）。
class ApiErrorResponse {
  const ApiErrorResponse({
    required this.traceId,
    required this.error,
    required this.path,
    required this.method,
  });

  final String traceId;
  final ApiErrorPayload error;
  final String path;
  final String method;

  /// [Core/Error] Dio の response.data から標準エラー応答を復元できる場合のみ返す。
  static ApiErrorResponse? tryParse(Object? data) {
    if (data is! Map) return null;
    final json = data.cast<String, dynamic>();

    final success = json['success'];
    if (success == true) return null;

    final traceId = json['trace_id'] as String?;
    final errorJson = (json['error'] as Map?)?.cast<String, dynamic>();
    final path = json['path'] as String?;
    final method = json['method'] as String?;

    // success が無くても、error が存在する場合は標準エラー応答として扱う。
    if (traceId == null || errorJson == null || path == null || method == null) {
      return null;
    }

    return ApiErrorResponse(
      traceId: traceId,
      error: ApiErrorPayload.fromJson(errorJson),
      path: path,
      method: method,
    );
  }
}


