import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests/validator.dart';

void main() {
  test('Validate for empty email address', () {
    // Arrange & Act
    var result = Validator.validateEmail('');
    // Assert
    expect(result, Validator.requiredFieldError);
  });

  test('Validate for invalid email address', () {
    // Arrange & Act
    var result = Validator.validateEmail('qwerty');
    // Assert
    expect(result, Validator.invalidEmailError);
  });

  test('Validate for valid email address', () {
    // Arrange & Act
    var result = Validator.validateEmail('abc.def@gmail.com');
    // Assert
    expect(result, null);
  });
  test('Validate for empty password', () {
    // Arrange & Act
    var result = Validator.validatePassword('');
    // Assert
    expect(result, Validator.requiredFieldError);
  });

  test('Validate for short password', () {
    // Arrange & Act
    var result = Validator.validatePassword('qwerty');
    // Assert
    expect(result, 'Password minimum length: 8 characters');
  });

  test('Validate for valid password', () {
    // Arrange & Act
    var result = Validator.validatePassword('p44sw0rd!');
    // Assert
    expect(result, null);
  });
}
