import 'package:vault/widgets/design.dart';
import 'package:vault/widgets/styles/text_styles.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset('lib/img/bg_register.png'),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: TransparentLogo(),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Sign In',
                      style: mediumHeading,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'to access to your vault',
                      style: greyText,
                    ),
                    const SizedBox(height: 40),
                    const SizedBox(height: 30.0),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: mediumGrey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            ' or sign in with',
                            style: TextStyle(
                              color: mediumGrey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: mediumGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    const BorderIconButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
