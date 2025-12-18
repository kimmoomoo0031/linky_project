import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/repositories/fake_home_repository.dart';
import 'domain/repositories/home_repository.dart';

/// Home 機能の DI（依存関係のつなぎ込み）。
///
/// Controller から参照されても循環 import にならないように、Repository だけを分離しておく。
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  // TODO(api): Dio/Retrofit 実装に差し替える。
  return FakeHomeRepository();
});


