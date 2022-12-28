import 'design.dart';

class DesignClickableText extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const DesignClickableText(
      {super.key,
      @required this.text,
      @required this.onPressed,
      this.textStyle,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding,
        child: Text(text.toString(), style: textStyle),
      ),
    );
  }
}

class BgTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String lable;

  const BgTextButton({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BorderIconButton extends StatelessWidget {
  final String img;
  final String lable;

  const BorderIconButton({super.key, required this.lable, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: mediumGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 27,
                    child: Image.asset(img),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(lable),
            ),
          ],
        ),
      ),
    );
  }
}
