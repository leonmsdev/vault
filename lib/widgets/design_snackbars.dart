import 'package:vault/widgets/design.dart';

generateSnackbar({
  required String text,
  required Color color,
  required IconData icon,
}) {
  return SnackBar(
    backgroundColor: color,
    content: SizedBox(
      height: 18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}
