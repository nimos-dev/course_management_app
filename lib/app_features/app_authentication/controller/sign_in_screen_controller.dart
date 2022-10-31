import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

class SignInScreenController extends StateNotifier<AsyncValue<void>> {
  SignInScreenController({required this.authRepository}) : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<String> signInWithEmailAndPassword(emailAddress, password, context) async {
    state = const AsyncLoading<void>();
    state =
        await AsyncValue.guard<void>(() => authRepository.signInWithEmailAndPassword(emailAddress, password, context));
    return 'APA';
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(() => authRepository.signInWithGoogle());
  }
}

// 
