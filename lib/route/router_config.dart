import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/controller/ui/content_controller_screen.dart';
import 'package:vault/features/generator/screens/generator_screen.dart';
import 'package:vault/features/home/screens/home_screen.dart';
import 'package:vault/features/key/key_screen.dart';
import 'package:vault/features/settings/screens/setting_screen.dart';
import 'package:vault/route/named_route.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
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
                  ));
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