import 'package:vault/features/auth/services/validate_form.dart';

import 'design.dart';

class BorderedFormField extends StatelessWidget {
  const BorderedFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validateEmail(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        labelText: 'Enter your email',
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: greyBorderColor,
          ),
        ),
      ),
    );
  }
}

class PwBorderedFormField extends StatefulWidget {
  const PwBorderedFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<PwBorderedFormField> createState() => _PwBorderedFormFieldState();
}

class _PwBorderedFormFieldState extends State<PwBorderedFormField> {
  Icon currentIcon = const Icon(Icons.visibility_outlined);
  bool obscureText = true;

  changeIcon() {
    setState(() {
      if (obscureText == true) {
        obscureText = false;
        currentIcon = const Icon(Icons.visibility_off_outlined);
      } else {
        obscureText = true;
        currentIcon = const Icon(Icons.visibility_outlined);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validatePw(value);
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        labelText: 'Enter your password',
        labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: greyBorderColor,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: changeIcon,
          child: currentIcon,
        ),
      ),
    );
  }
}
