import 'package:go_router/go_router.dart';
import 'package:vault/widgets/design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(
              height: 20,
            ),
            BgTextButton(
                lable: 'Key Screen',
                onTap: () => GoRouter.of(context).push('/keyDetail/1'))
          ],
        ),
      ),
    );
  }
}
