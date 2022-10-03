import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import 'controller/sign_in_screen_controller.dart';
import 'repositories/auth_repository.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref: ref, sharedPreferences: ref.read(sharedPreferencesProvider)));

final signInScreenControllerProvider = StateNotifierProvider.autoDispose<SignInScreenController, AsyncValue<void>>(
  (ref) => SignInScreenController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);
