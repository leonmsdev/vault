class ValidateFrom {}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  } else if (!regex.hasMatch(value) || !value.contains('.')) {
    return 'Please enter a valid email address';
  } else {
    return null;
  }
}

String? validatePw(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length <= 7) {
    return 'Please enter a valid password';
  } else {
    return null;
  }
}
