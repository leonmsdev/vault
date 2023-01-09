import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/controller/content_controller.dart';
import 'package:vault/route/go_route_notifier.dart';
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
      onTap: (value) => _onTap(value),
      currentIndex: position,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(FlutterRemix.home_fill),
          icon: Icon(FlutterRemix.home_line),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(FlutterRemix.shield_keyhole_fill),
          icon: Icon(FlutterRemix.shield_keyhole_line),
          label: "Generator",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(FlutterRemix.settings_fill),
          icon: Icon(FlutterRemix.settings_line),
          label: "Settings",
        )
      ],
    );
  }

  void _onTap(int index) {
    ref.read(contentControllerProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/generate');
        break;

      case 2:
        context.go('/setting');
        break;
      default:
    }
  }
}
