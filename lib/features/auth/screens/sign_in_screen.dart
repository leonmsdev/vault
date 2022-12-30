import 'dart:developer' as devtools show log;
import 'package:go_router/go_router.dart';
import 'package:vault/features/auth/services/firebase_auth.dart';

import '../../../widgets/design.dart';
import '../../../widgets/styles/text_styles.dart';
import '../widgets/transparent_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                            controller: emailController,
                          ),
                          const SizedBox(height: 25.0),
                          const PwBorderedFormField(
                            lable: 'Enter your password',
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => devtools.log('Forgot Password'),
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
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () => context.go('/register'),
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
                      onTap: () {
                        UserAuth user = UserAuth();
                        user.checkUser();
                      },
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
