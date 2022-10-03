import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

class SignInScreenController extends StateNotifier<AsyncValue<void>> {
  SignInScreenController({required this.authRepository}) : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<void> signInWithEmailAndPassword(emailAddress, password) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(() => authRepository.signInWithEmailAndPassword(emailAddress, password));
  }
}

// 
