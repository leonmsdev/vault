import 'package:flutter/material.dart';

class TransparentLogo extends StatelessWidget {
  const TransparentLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.33),
        borderRadius: BorderRadius.circular(25),
      ),
      height: 90,
      width: 90,
      child: Center(
        child: SizedBox(
          height: 54,
          child: Image.asset('lib/img/logo.png'),
        ),
      ),
    );
  }
}
