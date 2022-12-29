import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as devlogs show log;

import 'design.dart';

final List firstMasterKeyInputs = [];

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
          BgTextButton(
              lable: 'Enter',
              onTap: () {
                context.go('/');
                firstMasterKeyInputs.clear();
                formKey.currentState?.save();
                for (var element in firstMasterKeyInputs) {
                  if (element == null) {
                    devlogs.log('Error');
                  } else {}
                  devlogs.log('valid');
                  devlogs.log(firstMasterKeyInputs.toString());
                }
              }),
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
          if (firstMasterKeyInputs.length == 4) {
            firstMasterKeyInputs.clear();
          }
          firstMasterKeyInputs.add(value);
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
