import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';

part 'get_my_profile_result.freezed.dart';

/// 自分のプロフィール取得結果を表すドメイン用 Union 型。
@freezed
class GetMyProfileResult with _$GetMyProfileResult {
  /// 取得成功。
  const factory GetMyProfileResult.success(UserProfile profile) =
      GetMyProfileSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetMyProfileResult.networkError() =
      GetMyProfileNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetMyProfileResult.serverError() = GetMyProfileServerError;
}


