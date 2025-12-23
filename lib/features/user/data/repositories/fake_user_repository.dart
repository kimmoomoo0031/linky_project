import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';
import 'package:linky_project_0318/features/user/domain/repositories/user_repository.dart';

/// バックエンド未接続の段階で利用する、インメモリのダミー実装。
class FakeUserRepository implements UserRepository {
  UserProfile _profile = const UserProfile(
    nickname: 'テスト様',
    email: 'testuser@example.com',
    bio: 'よろしくお願いします。',
  );

  @override
  Future<UserProfile> getMyProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return _profile;
  }

  @override
  Future<void> updateMyProfile(UserProfile profile) async {
    await Future<void>.delayed(const Duration(milliseconds: 550));
    _profile = profile;
  }
}


