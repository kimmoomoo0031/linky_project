import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_create_controller.dart';
import 'package:linky_project_0318/features/lounge/presentation/states/lounge_create_state.dart';

final loungeCreateControllerProvider =
    StateNotifierProvider.autoDispose<LoungeCreateController, LoungeCreateState>(
  (ref) => LoungeCreateController(ref),
);


