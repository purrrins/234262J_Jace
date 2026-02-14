import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/login.dart';

void main() {
  testWidgets('Login button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final emailField = find.byKey(Key('emailField'));
    final passwordField = find.byKey(Key('passwordField'));
    final loginButton = find.byKey(Key('loginButton'));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.enterText(emailField, 'demo@example.com');
    await tester.enterText(passwordField, '123');

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(find.text('Cheers'), findsOneWidget);
  });
}
