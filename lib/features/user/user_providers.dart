import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/controllers/profile_edit_controller.dart';
import 'presentation/controllers/profile_edit_state.dart';

final profileEditControllerProvider =
    StateNotifierProvider.autoDispose<ProfileEditController, ProfileEditState>(
  (ref) => ProfileEditController(ref),
);


