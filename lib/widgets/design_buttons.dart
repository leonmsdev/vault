import 'design.dart';

class BgTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String lable;

  const BgTextButton({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
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

class LableButton extends StatelessWidget {
  final VoidCallback onTap;
  final String lable;

  const LableButton({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: mediumGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            lable,
            style: const TextStyle(
              color: black,
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
  final VoidCallback onTap;

  const BorderIconButton(
      {super.key, required this.lable, required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
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
