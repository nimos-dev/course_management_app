import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../app_features/app_authentication/app_service.dart';
import '../app_features/app_authentication/presentation/screens/create_account_screen.dart';
import '../app_features/app_authentication/presentation/screens/sign_in_screen.dart';
import '../app_features/app_home/app_home_features/user_courses/presentation/screens/details_screen.dart';
import '../app_features/app_home/presentation/screens/home_screen.dart';
import '../app_features/app_introduction/presentation/screens/splash_screen.dart';
import '../app_features/app_onboarding/presentation/screens/onboard_screen.dart';
import '../common_screens/error_screen.dart';

import 'constants.dart';

class AppRouter {
  final AppService appService;

  AppRouter(this.appService);

  late final router = GoRouter(
    refreshListenable: appService,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: rootRouteName,
    routes: [
      GoRoute(
        name: rootRouteName,
        path: '/',
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'overview'}),
      ),
      GoRoute(
        name: loginRouteName,
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignInScreen(),
        ),
      ),
      GoRoute(
        name: createAccountRouteName,
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: CreateAccountScreen(),
        ),
      ),

      GoRoute(
        name: splashRouteName,
        path: '/splash',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),

      GoRoute(
        name: onboardRouteName,
        path: '/onboard-location',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const OnboardScreen(),
        ),
      ),

      GoRoute(
        name: homeRouteName,
        path: '/home/:tab(overview|courses|profile|settings)',
        pageBuilder: (context, state) {
          final tab = state.params['tab']!;
          return MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(tab: tab),
          );
        },
        routes: [
          GoRoute(
            name: subCoursesDetailsRouteName,
            path: 'details/:course',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: DetailsScreen(
                id: state.params['course']!,
              ),
            ),
          ),
        ],
      ),

      // redirect...

      GoRoute(
        path: '/overview',
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'overview'}),
      ),
      GoRoute(
        path: '/courses',
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'courses'}),
      ),
      GoRoute(
        path: '/profile',
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'profile'}),
      ),
      GoRoute(
        path: '/settings',
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'settings'}),
      ),

      // ----->

      GoRoute(
        name: coursesDetailsRouteName,
        path: '/details-redirector/:course',
        redirect: (state) => state.namedLocation(
          subCoursesDetailsRouteName,
          params: {'tab': 'courses', 'course': state.params['course']!},
        ),
      ),
    ],

    // ----->

    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorScreen(error: state.error),
    ),

    // ----->

    // Sign In / Register Account redirect logic

    redirect: (state) {
      final loginLocation = state.namedLocation(loginRouteName);
      final signupLocation = state.namedLocation(createAccountRouteName);
      final rootLocation = state.namedLocation(rootRouteName);
      final splashLocation = state.namedLocation(splashRouteName);
      final onboardLocation = state.namedLocation(onboardRouteName);

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;
      final isOnboarded = appService.onboarding;

      final isGoingToLogin = state.subloc == loginLocation;
      final isGoingToSignup = state.subloc == signupLocation;
      final isGoingToInit = state.subloc == splashLocation;
      final isGoingToOnboard = state.subloc == onboardLocation;

      if (!isInitialized && !isGoingToInit) {
        // print('splash Screen');
        return splashLocation;
      } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
        // print('onboard screen');
        return onboardLocation;
      } else if (isInitialized && isOnboarded && !isLogedIn && !isGoingToLogin && !isGoingToSignup) {
        // print('Login');
        return loginLocation;
      } else if ((isLogedIn && isGoingToLogin) ||
          (isLogedIn && isGoingToSignup) ||
          (isInitialized && isGoingToInit) ||
          (isOnboarded && isGoingToOnboard)) {
        // print('root');
        return rootLocation;
      } else {
        return null;
      }

      /* final loggingIn = state.subloc == loginLocation;
      final createAccountLoc = state.namedLocation(createAccountRouteName);
      final creatingAccount = state.subloc == createAccountLoc;
      final loggedIn = appService.loginState;
      final rootLoc = state.namedLocation(rootRouteName);

      if (!loggedIn && !loggingIn && !creatingAccount) return loginLocation;
      if (loggedIn && (loggingIn || creatingAccount)) return rootLoc; */

      // return null;
    },
  );
}

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref.read(appServiceProvider)));
