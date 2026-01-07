import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_info_controller.dart';
final loungeInfoControllerProvider = AsyncNotifierProviderFamily<
    LoungeInfoController, LoungeInfoViewData, int>(LoungeInfoController.new);


