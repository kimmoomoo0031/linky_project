import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/di/lounge_di.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_post_create_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_post_create_state.dart';

final loungePostCreateControllerProvider = StateNotifierProvider.autoDispose
    .family<
        LoungePostCreateController,
        LoungePostCreateState,
        LoungePostCreateArgs>(
  (ref, args) => LoungePostCreateController(
    ref,
    args,
    ref.read(createLoungePostUseCaseProvider),
  ),
);

