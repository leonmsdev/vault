import 'package:vault/widgets/design.dart';

import '../../../widgets/design_bottom_navigation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
      body: SafeArea(
        child: Center(
          child: Text('Settings Screen'),
        ),
      ),
    );
  }
}
