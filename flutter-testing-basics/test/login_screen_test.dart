import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/login_screen.dart';
import 'package:testing/validator.dart';

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
      final title = find.text('Login');

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
      final emailTextField = find.byKey(
        const ValueKey('email'),
      );

      // Assert
      expect(emailTextField, findsOneWidget);
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
      final passTextField = find.byKey(
        const ValueKey('pass'),
      );

      // Assert
      expect(passTextField, findsOneWidget);
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
      final loginButton = find.byType(ElevatedButton);

      // Assert
      expect(loginButton, findsOneWidget);
    },
  );

  testWidgets(
    'Should show required data missing error message if email or pass is empty',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      final loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      // Wait for UI updates (animations)
      await tester.pumpAndSettle();

      final errorText = find.text(Validator.requiredFieldError);

      // Assert
      expect(errorText, findsNWidgets(2));
    },
  );

  testWidgets(
    'Should show that a valid email is required',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      final loginButton = find.byType(ElevatedButton);
      final emailTextField = find.byKey(
        const ValueKey('email'),
      );

      await tester.enterText(emailTextField, 'abcdefgh');
      await tester.tap(loginButton);

      // Wait for UI updates (animations)
      await tester.pumpAndSettle();

      final errorText = find.text(Validator.invalidEmailError);

      // Assert
      expect(errorText, findsNWidgets(1));
    },
  );

  testWidgets(
    'Should show that the password should be at least 8 characters long',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      final loginButton = find.byType(ElevatedButton);
      final passTextField = find.byKey(
        const ValueKey('pass'),
      );

      await tester.enterText(passTextField, '1234567');
      await tester.tap(loginButton);

      // Wait for UI updates (animations)
      await tester.pumpAndSettle();

      final errorText = find.text(Validator.passwordLengthError);

      // Assert
      expect(errorText, findsNWidgets(1));
    },
  );

  testWidgets(
    'Should submit form when mail and pass are valid',
    (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      final loginButton = find.byType(ElevatedButton);

      final emailTextField = find.byKey(
        const ValueKey('email'),
      );

      final passTextField = find.byKey(
        const ValueKey('pass'),
      );

      await tester.enterText(emailTextField, 'user@email.com');
      await tester.enterText(passTextField, '12345678');
      await tester.tap(loginButton);

      // Wait for UI updates (animations)
      await tester.pumpAndSettle();

      final errorText = find.text(Validator.requiredFieldError);

      // Assert
      expect(errorText, findsNothing);
    },
  );
}
