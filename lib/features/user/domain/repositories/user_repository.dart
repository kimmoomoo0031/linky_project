import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> getMyProfile();

  Future<void> updateMyProfile(UserProfile profile);
}


