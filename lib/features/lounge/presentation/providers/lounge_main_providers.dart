import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_main_controller.dart';
final loungeMainControllerProvider = AsyncNotifierProviderFamily<
    LoungeMainController, LoungeMainViewData, int>(LoungeMainController.new);


