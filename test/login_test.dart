import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_agatha/screen/view/login.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    final loginViewModel = LoginViewModel();
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => loginViewModel,
          child: const LoginScreen(),
        ),
      ),
    );
    final imageFinder = find.byType(Image);
    final emailField = find.widgetWithText(TextField, 'Email');
    final passwordField = find.widgetWithText(TextField, 'Password');

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(imageFinder, findsOneWidget);
  });
}
