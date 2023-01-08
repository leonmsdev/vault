import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault/route/go_route_notifier.dart';
import 'package:vault/widgets/design.dart';

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
              ref.read(goRouterNotifierProvider).isSignedIn = false;
            },
            child: const Text('Log out'))
      ],
    );
  }
}
