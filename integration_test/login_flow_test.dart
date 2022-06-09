import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing/login_screen.dart';
import 'package:testing/validator.dart';

void main() {
  group('Login flow test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Should show required fields when users tries to login without credentials',
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
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );

      final errorText = find.text(Validator.requiredFieldError);

      // Assert
      expect(errorText, findsNWidgets(2));
    });

    testWidgets(
        'Should show Home screen when users tries to login with valid credentials',
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
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );

      final welcomeText = find.text('Welcome Home!');

      // Assert
      expect(welcomeText, findsOneWidget);
    });
  });
}
