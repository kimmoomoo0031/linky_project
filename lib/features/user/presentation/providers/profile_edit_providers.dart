import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/user/presentation/controllers/profile_edit_controller.dart';
import 'package:linky_project_0318/features/user/presentation/states/profile_edit_state.dart';

final profileEditControllerProvider =
    StateNotifierProvider.autoDispose<ProfileEditController, ProfileEditState>(
  (ref) => ProfileEditController(ref),
);


