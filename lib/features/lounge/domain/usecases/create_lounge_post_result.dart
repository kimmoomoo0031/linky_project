import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_lounge_post_result.freezed.dart';

/// ラウンジ投稿作成の結果を表すドメイン用 Union 型。
@freezed
class CreateLoungePostResult with _$CreateLoungePostResult {
  /// 作成成功。
  const factory CreateLoungePostResult.success(int postId) =
      CreateLoungePostSuccess;

  /// 入力バリデーションエラー。
  const factory CreateLoungePostResult.validationError(String message) =
      CreateLoungePostValidationError;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory CreateLoungePostResult.networkError() =
      CreateLoungePostNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory CreateLoungePostResult.serverError() =
      CreateLoungePostServerError;
}

