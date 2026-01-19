import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/features/home/domain/entities/home_user.dart';

part 'get_home_me_result.freezed.dart';

/// ホーム画面の自分情報取得結果を表すドメイン用 Union 型。
@freezed
class GetHomeMeResult with _$GetHomeMeResult {
  /// 取得成功。
  const factory GetHomeMeResult.success(HomeUser user) = GetHomeMeSuccess;

  /// ネットワークエラー（タイムアウト / DNS など）。
  const factory GetHomeMeResult.networkError() = GetHomeMeNetworkError;

  /// サーバー側のエラー（5xx や想定外レスポンスなど）。
  const factory GetHomeMeResult.serverError() = GetHomeMeServerError;
}


