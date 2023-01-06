import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/screens/master_key_screen.dart';
import 'package:vault/features/auth/screens/register_screen.dart';
import 'package:vault/features/auth/screens/sign_in_screen.dart';
import 'package:vault/features/auth/screens/verification_screen.dart';
import 'package:vault/features/generator/screens/generator_screen.dart';
import 'package:vault/features/home/screens/home_screen.dart';
import 'package:vault/features/settings/screens/setting_screen.dart';
import 'package:vault/main.dart';
import 'package:vault/routing/named_route.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/master-key',
      builder: (context, state) => const MasterKey(),
    ),
    GoRoute(
      path: '/verify-email',
      builder: (context, state) => const VerifyEmail(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(
        child: HomeContent(),
      ),
    ),
    ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => GeneratorScreen(
              key: state.pageKey,
              child: const GeneratorContent(),
            ),
        routes: [
          GoRoute(
            path: '/',
            name: generate,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                  child: GeneratorScreen(
                child: GeneratorContent(),
              ));
            },
          )
        ]),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(
        child: SettingsContent(),
      ),
    )
  ],
);
