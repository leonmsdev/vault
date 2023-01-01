import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/services/auth_service.dart';
import 'package:vault/widgets/design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
