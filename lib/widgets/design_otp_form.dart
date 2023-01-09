import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../route/go_route_notifier.dart';
import 'design.dart';

final List masterKeyInputs = [];

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OtpTextFormField(),
              OtpTextFormField(),
              OtpTextFormField(),
              OtpTextFormField(
                nextFocus: false,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Consumer(
            builder: (context, ref, child) => BgTextButton(
                lable: 'Enter',
                onTap: () {
                  masterKeyInputs.clear();
                  formKey.currentState?.save();
                  if (masterKeyInputs.toString() == '[1, 2, 3, 4]') {
                    ref.read(goRouterNotifierProvider).validMasterKey = true;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      generateSnackbar(
                        text: 'Your input is wrong, please try again.',
                        color: snackBarRed,
                        icon: Icons.error_outline,
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class OtpTextFormField extends StatelessWidget {
  final bool? nextFocus;
  const OtpTextFormField({Key? key, this.nextFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 48,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1 && nextFocus == null) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: ligthBlueGrey,
            hintText: '0',
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: darkGrey,
            ),
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(
                color: mediumGrey,
                width: 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
            )),
        onSaved: (value) {
          if (masterKeyInputs.length == 4) {
            masterKeyInputs.clear();
          }

          masterKeyInputs.add(value);
        },
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
