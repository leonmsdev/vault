import 'package:vault/widgets/design.dart';

import '../features/auth/services/auth_service.dart';
import 'dart:developer' as devtools show log;

Future showPasswordResetnDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 25, bottom: 25),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        actionsPadding: const EdgeInsets.only(bottom: 25),
        actions: const [],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: const Center(
          child: Text(
            'Reset your password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        content: const ForgotPassword(),
      );
    },
  );
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Please enter your email address and we’ll send you instructions to reset your password. \n \nFor security reasons, we do NOT store your password.This means we will never send your password via email.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          BorderedFormField(
            controller: _emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          BgTextButton(
            lable: 'Reset password',
            onTap: () async {
              final email = _emailController.text;

              try {
                AuthService.firebase().resetPassword(email: email);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  generateSnackbar(
                      text: 'Password reset is send to your email.',
                      color: snackBarGreen,
                      icon: Icons.verified),
                );
              } catch (e) {
                devtools.log('loool');
              }
            },
          )
        ],
      ),
    );
  }
}
