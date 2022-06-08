class Validator {
  static const invalidEmailError = 'Please enter a valid email address';
  static const passwordLengthError = 'Password minimum length: 8 characters';
  static const requiredFieldError = 'Required field';

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return requiredFieldError;
    }

    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return invalidEmailError;
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return requiredFieldError;
    }

    if (password.length < 8) {
      return passwordLengthError;
    }

    return null;
  }
}
