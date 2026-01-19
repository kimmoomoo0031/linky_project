import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_my_profile_result.freezed.dart';

/// 自分のプロフィール更新結果を表すドメイン用 Union 型。
@freezed
class UpdateMyProfileResult with _$UpdateMyProfileResult {
  /// 更新成功。
  const factory UpdateMyProfileResult.success() = UpdateMyProfileSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory UpdateMyProfileResult.networkError() =
      UpdateMyProfileNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory UpdateMyProfileResult.serverError() = UpdateMyProfileServerError;
}


