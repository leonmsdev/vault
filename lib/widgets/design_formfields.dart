import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault/features/auth/screens/register_screen.dart';
import 'package:vault/features/auth/services/validate_form.dart';

import 'design.dart';

class BorderedFormField extends StatelessWidget {
  final TextEditingController controller;
  const BorderedFormField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
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
  final String lable;
  final bool? isFirst;
  final bool? shouldValidate;
  final String? value;
  final TextEditingController? controller;

  const PwBorderedFormField({
    Key? key,
    this.value,
    this.isFirst,
    this.shouldValidate,
    this.controller,
    required this.lable,
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
    return Consumer(
      builder: (context, ref, child) {
        return TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (widget.isFirst == true) {
              ref.read(valueProvider.notifier).state = value!;
            }
            return validatePw(value, ref.watch(valueProvider), widget.isFirst,
                widget.shouldValidate);
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline),
            labelText: widget.lable,
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
      },
    );
  }
}
