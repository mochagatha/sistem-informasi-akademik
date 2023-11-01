import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_agatha/screen/view/ai.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_ai.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    final loginViewModel = AiViewModel();
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => loginViewModel,
          child: const Ai(),
        ),
      ),
    );
    // Find the Container widget.
    final container = find.byType(Container);

    // Verify that the Container is displayed.
    expect(container, findsWidgets);

  });
}
