import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests/maths_utils.dart';

void main() {
  group('Math utils', () {
    test('Check for two number addition', () {
      // Arrange
      var a = 10;
      var b = 10;

      // Act
      var result = add(a, b);

      // Assert
      expect(result, 20);
    });

    test('Check for two number substraction', () {
      // Arrange
      var a = 20;
      var b = 10;

      // Act
      var result = substract(a, b);

      // Assert
      expect(result, 10);
    });

    test('Check for two number multiplication', () {
      // Arrange
      var a = 20;
      var b = 10;

      // Act
      var result = multiply(a, b);

      // Assert
      expect(result, 200);
    });
  });
}
