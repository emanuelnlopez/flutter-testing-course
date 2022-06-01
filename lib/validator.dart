class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required field';
    }

    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required field';
    }

    if (password.length < 8) {
      return 'Password minimum length: 8 characters';
    }

    return null;
  }
}
