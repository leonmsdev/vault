import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/services/auth_service.dart';
import 'package:vault/widgets/design.dart';

import '../../../widgets/design_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SafeArea(child: widget.child),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 50),
            BgTextButton(
              lable: 'Log out',
              onTap: () {
                AuthService.firebase().signOut();
                context.go('/sign-in');
              },
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  generateSnackbar(
                      text: 'An Error occured',
                      color: snackBarRed,
                      icon: Icons.error_outline),
                );
              },
              child: const Text('SnackBar'),
            )
          ],
        ),
      ),
    );
  }
}
