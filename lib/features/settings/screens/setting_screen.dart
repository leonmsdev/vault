import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault/features/auth/services/auth_service.dart';
import 'package:vault/route/go_route_notifier.dart';
import 'package:vault/widgets/design.dart';

import '../../../controller/content_controller.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Settings Screen'),
        TextButton(
            onPressed: () {
              try {
                AuthService.firebase().signOut();
                ref.read(goRouterNotifierProvider).isSignedIn = false;
                ref.read(contentControllerProvider.notifier).setPosition(0);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  generateSnackbar(
                      text: 'An error occured',
                      color: snackBarRed,
                      icon: Icons.error_outline),
                );
              }
            },
            child: const Text('Log out'))
      ],
    );
  }
}
