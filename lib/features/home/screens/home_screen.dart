import 'package:vault/widgets/design.dart';

import '../../../widgets/design_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              Text('Home Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
