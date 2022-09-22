import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../providers/login_state.dart';
import '../constants/constants.dart';
import '../screens/screens.dart';

class AppRouter {
  final LoginState loginState;

  AppRouter(this.loginState);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics: false,
    urlPathStrategy: UrlPathStrategy.path,
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
          child: const CreateAccountScreen(),
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
      final loginLoc = state.namedLocation(loginRouteName);
      final loggingIn = state.subloc == loginLoc;
      final createAccountLoc = state.namedLocation(createAccountRouteName);
      final creatingAccount = state.subloc == createAccountLoc;
      final loggedIn = loginState.loggedIn;
      final rootLoc = state.namedLocation(rootRouteName);

      if (!loggedIn && !loggingIn && !creatingAccount) return loginLoc;
      if (loggedIn && (loggingIn || creatingAccount)) return rootLoc;
      return null;
    },
  );
}

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref.read(loginStateProvider)));
