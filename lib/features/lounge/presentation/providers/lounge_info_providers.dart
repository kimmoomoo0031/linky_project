import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/domain/entities/lounge_info.dart';
import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_info_controller.dart';
final loungeInfoControllerProvider = AsyncNotifierProviderFamily<
    LoungeInfoController, LoungeInfo, int>(LoungeInfoController.new);


