import '../entities/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> getMyProfile();

  Future<void> updateMyProfile(UserProfile profile);
}


