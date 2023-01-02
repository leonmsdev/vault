import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/services/auth_service.dart';
import 'package:vault/widgets/design_pw_reset.dart';

import '../../../widgets/design.dart';
import '../../../widgets/styles/text_styles.dart';
import '../widgets/transparent_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  final _formKey = GlobalKey<FormState>();

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
            Image.asset('lib/img/bg_sign_in.png'),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          BorderedFormField(
                            controller: _emailController,
                          ),
                          const SizedBox(height: 25.0),
                          PwBorderedFormField(
                            controller: _pwController,
                            lable: 'Enter your password',
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  showPasswordResetnDialog(context);
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          BgTextButton(
                            lable: 'Sign In',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                final email = _emailController.text;
                                final password = _pwController.text;

                                try {
                                  await AuthService.firebase().signIn(
                                    email: email,
                                    password: password,
                                  );

                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    generateSnackbar(
                                        text: 'You are successfuly signed in.',
                                        color: snackBarGreen,
                                        icon: Icons.verified),
                                  );
                                  context.go('verify-email');
                                } catch (e) {
                                  generateSnackbar(
                                      text: 'An error occured',
                                      color: snackBarRed,
                                      icon: Icons.error_outline);
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () => context.go('/sign-in/register'),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Dont have an account, ',
                                    style: TextStyle(
                                      color: mediumGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'sign up for free',
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
                            'or sign in with',
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
                      onTap: () async {},
                    ),
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
