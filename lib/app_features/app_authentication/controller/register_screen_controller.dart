import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

class RegisterScreenController extends StateNotifier<AsyncValue<void>> {
  RegisterScreenController({required this.authRepository}) : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<void> registerWithEmailAndPassword(emailAddress, password) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(() => authRepository.registerWithEmailAndPassword(emailAddress, password));
  }
}

// 