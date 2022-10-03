import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_features/app_authentication/app_authentication_providers.dart';

import 'app_router/app_router.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref.read(authRepositoryProvider)));
