import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests/login_screen.dart';

void main() {
  testWidgets(
    'Should have a title',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder title = find.text('Login');

      // Assert
      expect(title, findsOneWidget);
    },
  );

  testWidgets(
    'Should have a textfield form to collect user email',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(const ValueKey('email'));

      // Assert
      expect(userNameTextField, findsOneWidget);
    },
  );

  testWidgets(
    'Should have a textfield form to collect user password',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userPassTextField = find.byKey(const ValueKey('pass'));

      // Assert
      expect(userPassTextField, findsOneWidget);
    },
  );

  testWidgets(
    'Should have a login button',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder loginButton = find.byType(ElevatedButton);

      // Assert
      expect(loginButton, findsOneWidget);
    },
  );
}
