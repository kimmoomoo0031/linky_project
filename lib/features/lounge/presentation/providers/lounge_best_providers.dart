import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_best_controller.dart';

final loungeBestControllerProvider =
    AsyncNotifierProviderFamily<LoungeBestController, LoungeBestViewData, int>(
  LoungeBestController.new,
);


