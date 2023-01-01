import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault/widgets/design.dart';
import 'package:vault/widgets/styles/text_styles.dart';
import '../services/auth_service.dart';
import '../widgets/widgets.dart';

final valueProvider = StateProvider<String>((ref) => 'Hello');

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset('lib/img/bg_register.png'),
            SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: GestureDetector(
                          onTap: () => context.go('/sign-in'),
                          child: const Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Center(
                          child: TransparentLogo(),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Register now',
                          style: mediumHeading,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'and use your personal secure vault.',
                          style: greyText,
                        ),
                        const SizedBox(height: 40),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              BorderedFormField(
                                controller: _emailController,
                              ),
                              const SizedBox(height: 25.0),
                              Consumer(
                                builder: (context, ref, child) {
                                  return PwBorderedFormField(
                                    value:
                                        ref.read(valueProvider.notifier).state,
                                    lable: 'Enter your password',
                                    shouldValidate: false,
                                    isFirst: true,
                                  );
                                },
                              ),
                              const SizedBox(height: 25.0),
                              Consumer(
                                builder: (context, ref, child) {
                                  return PwBorderedFormField(
                                      value: ref.watch(valueProvider),
                                      lable: 'Repeat your password',
                                      isFirst: false,
                                      shouldValidate: true,
                                      controller: _pwController);
                                },
                              ),
                              const SizedBox(height: 35.0),
                              BgTextButton(
                                lable: 'Register Now',
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final email = _emailController.text;
                                    final password = _pwController.text;

                                    try {
                                      await AuthService.firebase().registerUser(
                                        email: email,
                                        password: password,
                                      );
                                      if (!mounted) return;
                                      context.go('/sign-in');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        generateSnackbar(
                                            text:
                                                'Registered, please sign in with your user.',
                                            color: snackBarGreen,
                                            icon: Icons.verified),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        generateSnackbar(
                                            text: 'An Error occured',
                                            color: snackBarRed,
                                            icon: Icons.error_outline),
                                      );
                                    }
                                  }
                                },
                              ),
                              const SizedBox(height: 10.0),
                              GestureDetector(
                                onTap: () => context.go('/sign-in'),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Already have an account, ',
                                        style: TextStyle(
                                          color: mediumGrey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'sign in here.',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
                                'or register with',
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
                        BorderIconButton(
                          lable: 'Google',
                          img: 'lib/img/google.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
