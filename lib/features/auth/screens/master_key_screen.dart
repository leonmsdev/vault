import 'package:lottie/lottie.dart';
import 'package:vault/widgets/design.dart';

import '../../../widgets/styles/text_styles.dart';
import '../widgets/transparent_logo.dart';

class MasterKey extends StatelessWidget {
  const MasterKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 235,
                ),
                SizedBox(
                  height: 155,
                  child: Lottie.asset('lib/lotties/lock.json'),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset('lib/img/bg_master_key.png'),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: TransparentLogo(),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Welcome back',
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
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: const [
                                SizedBox(height: 60),
                                Text(
                                  'Enter your Master-Key',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Please enter your Master-Key to enter your personal vault.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: darkGrey),
                                ),
                                SizedBox(height: 25),
                                OtpForm(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
