import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/user/presentation/controllers/withdraw_controller.dart';
import 'package:linky_project_0318/features/user/presentation/states/withdraw_state.dart';

final withdrawControllerProvider =
    StateNotifierProvider.autoDispose<WithdrawController, WithdrawState>(
  (ref) => WithdrawController(ref),
);


