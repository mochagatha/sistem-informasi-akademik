import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_agatha/screen/view/ai.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_ai.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test Ai Screen', (WidgetTester tester) async {
    // Mock the AiViewModel
    final viewModel = AiViewModel();
    viewModel.dataAi = [
      {
        'text': 'Ini adalah jawaban dari AI untuk pertanyaan Anda.'
      },
      {
        'text': 'Jawaban lain dari AI.'
      },
    ];

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => viewModel),
        ],
        child: MaterialApp(
          home: const Ai(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Ensure that the mock data is displayed on the screen
    expect(find.text('Ini adalah jawaban dari AI untuk pertanyaan Anda.'), findsOneWidget);
    expect(find.text('Jawaban lain dari AI.'), findsOneWidget);

    // Simulate user input
    await tester.enterText(find.byType(TextFormField), 'Apa itu Flutter?');

    // Tap the "Submit" button
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // Ensure that the loading indicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Mock the AiViewModel again with new data
    viewModel.dataAi = [
      {
        'text': 'Jawaban AI untuk pertanyaan: Apa itu Flutter?'
      },
    ];

    await tester.pumpAndSettle();

    // Ensure that the new data from the mock is displayed
    expect(find.text('Jawaban AI untuk pertanyaan: Apa itu Flutter?'), findsOneWidget);
  });
}
