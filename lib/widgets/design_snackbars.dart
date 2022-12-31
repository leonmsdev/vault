import 'package:vault/widgets/design.dart';

class ErrorSnackBar extends StatelessWidget {
  final String text;

  const ErrorSnackBar({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.alarm),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
