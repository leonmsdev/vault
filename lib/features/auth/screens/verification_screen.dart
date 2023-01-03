import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:vault/features/auth/services/auth_service.dart';
import 'package:vault/widgets/design.dart';
import 'package:vault/widgets/styles/text_styles.dart';

import '../widgets/widgets.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('lib/img/bg_master_key.png'),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Center(
                    child: TransparentLogo(),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Welcome at Vault',
                    style: mediumHeading,
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ligthGrey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 25, top: 13),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Lottie.asset(
                                  'lib/lotties/verified-badge.json',
                                  repeat: false),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Verify your email address',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'We send you an email with instructions on how to verify your email address.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: darkGrey),
                            ),
                            const SizedBox(height: 25),
                            BgTextButton(
                                lable: 'Send email verification',
                                onTap: () {
                                  AuthService.firebase()
                                      .sendEmailVerification();
                                })
                          ],
                        ),
                      ),
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
                              'or',
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
                      LableButton(
                          lable: 'Sign Out',
                          onTap: () {
                            AuthService.firebase().signOut();
                            context.go('/sign-in');
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
