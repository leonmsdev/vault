import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/controller/content_controller.dart';
import 'package:vault/widgets/design.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(contentControllerProvider);

    return BottomNavigationBar(
      onTap: (value) => onTap(value),
      currentIndex: position,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.shield),
          icon: Icon(Icons.shield_outlined),
          label: "Generator",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: "Settings",
        )
      ],
    );
  }

  void onTap(int index) {
    ref.read(contentControllerProvider.notifier).setPosition(0);
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/generator');
        break;

      case 2:
        context.go('/settings');
        break;
    }
  }
}
