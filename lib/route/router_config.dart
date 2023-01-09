import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/controller/ui/content_controller_screen.dart';
import 'package:vault/features/auth/screens/master_key_screen.dart';
import 'package:vault/features/auth/screens/register_screen.dart';
import 'package:vault/features/auth/screens/sign_in_screen.dart';
import 'package:vault/features/auth/screens/verification_screen.dart';
import 'package:vault/features/generator/screens/generator_screen.dart';
import 'package:vault/features/home/screens/home_screen.dart';
import 'package:vault/features/key/key_screen.dart';
import 'package:vault/features/settings/screens/setting_screen.dart';
import 'package:vault/route/go_route_notifier.dart';
import 'package:vault/route/named_route.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);
  bool isDuplicate = false;

  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    refreshListenable: notifier,

    redirect: (context, state) {
      final isLoggedIn = notifier.isSignedIn;
      final isGoingToLogin = state.subloc == '/signIn';
      final isGoingToRegister = state.subloc == '/signIn/register';

      if (!isLoggedIn &&
          !isGoingToLogin &&
          !isDuplicate &&
          !isGoingToRegister) {
        isDuplicate = true;
        return '/signIn';
      }

      if (isGoingToLogin && !isGoingToRegister && !isDuplicate) {
        isDuplicate = true;
        return '/';
      }

      if (isDuplicate) {
        isDuplicate = false;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          path: '/signIn',
          name: signIn,
          builder: (context, state) {
            return SignInScreen(key: state.pageKey);
          },
          routes: [
            GoRoute(
              path: 'register',
              name: register,
              builder: (context, state) {
                return RegisterScreen(
                  key: state.pageKey,
                );
              },
            ),
          ]),
      GoRoute(
        path: '/verify',
        name: verify,
        builder: (context, state) => VerifyEmail(key: state.pageKey),
      ),
      GoRoute(
        path: '/masterKey',
        name: masterKey,
        builder: (context, state) => MasterKey(key: state.pageKey),
      ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) =>
              ContentControllerScreen(key: state.pageKey, child: child),
          routes: [
            GoRoute(
                path: '/',
                name: home,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: HomeScreen(
                      key: state.pageKey,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: _shellNavigator,
                    path: 'keyDetail/:id',
                    name: keyDetail,
                    pageBuilder: (context, state) {
                      final id = state.params['id'].toString();
                      return NoTransitionPage(
                        child: KeyScreen(
                          id: int.parse(id),
                          key: state.pageKey,
                        ),
                      );
                    },
                  )
                ]),
            GoRoute(
              path: '/generate',
              name: generate,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: GeneratorScreen(
                  key: state.pageKey,
                ));
              },
            ),
            GoRoute(
              path: '/setting',
              name: setting,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: SettingsScreen(
                  key: state.pageKey,
                ));
              },
            )
          ]),
    ],
    //Implement Error Screen here.
  );
});
