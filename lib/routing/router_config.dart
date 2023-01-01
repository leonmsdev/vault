import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/screens/master_key_screen.dart';
import 'package:vault/features/auth/screens/register_screen.dart';
import 'package:vault/features/auth/screens/sign_in_screen.dart';
import 'package:vault/features/home/screens/home_screen.dart';
import 'package:vault/main.dart';

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
          routes: [
            GoRoute(
              path: 'master-key',
              builder: (context, state) => const MasterKey(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
