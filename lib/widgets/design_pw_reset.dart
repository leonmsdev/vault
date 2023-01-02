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
          child: Text('Reset your password'),
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
      height: 311,
      child: Column(
        children: [
          const Text(
            'Enter the email address you used when you joined and we’ll send you instructions to reset your password. \n \nFor security reasons, we do NOT store your password. So rest assured that we will never send your password via email.',
            style: TextStyle(fontSize: 12),
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
