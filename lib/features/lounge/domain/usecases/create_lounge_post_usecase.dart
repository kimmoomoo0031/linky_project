import 'package:linky_project_0318/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:linky_project_0318/features/lounge/domain/usecases/create_lounge_post_result.dart';

/// ラウンジ投稿を作成するユースケース。
class CreateLoungePostUseCase {
  CreateLoungePostUseCase(this._repository);

  final LoungeRepository _repository;

  Future<CreateLoungePostResult> call({
    required int loungeId,
    required String title,
    required String contentHtml,
    required String contentPlain,
    required List<String> imagePaths,
    String? guestNickname,
    String? guestPassword,
  }) async {
    try {
      final postId = await _repository.createLoungePost(
        loungeId: loungeId,
        title: title,
        contentHtml: contentHtml,
        contentPlain: contentPlain,
        imagePaths: imagePaths,
        guestNickname: guestNickname,
        guestPassword: guestPassword,
      );
      return CreateLoungePostResult.success(postId);
    } catch (_) {
      return const CreateLoungePostResult.serverError();
    }
  }
}

