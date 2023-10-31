import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_agatha/screen/view/home.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_berita.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test HomeScreen', (WidgetTester tester) async {
    // Mock the BeritaViewModel
    final viewModel = BeritaViewModel();
    viewModel.newsData = {
      'data': [
        {
          'attributes': {
            'judul': 'Berita 1',
            'deskripsi': 'Deskripsi Berita 1',
            'gambar': 'https://example.com/image1.jpg',
          },
        },
        {
          'attributes': {
            'judul': 'Berita 2',
            'deskripsi': 'Deskripsi Berita 2',
            'gambar': 'https://example.com/image2.jpg',
          },
        },
      ],
    };

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => viewModel),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Ensure the first berita item is displayed
    expect(find.text('Berita 1'), findsOneWidget);
    expect(find.text('Deskripsi Berita 1...'), findsOneWidget);

    // Tap the "Selanjutnya" button
    await tester.tap(find.text('Selanjutnya'));
    await tester.pumpAndSettle();

    // Ensure that the detail page is navigated to
    expect(find.text('Detail Berita'), findsOneWidget);

    // Mock the BeritaViewModel again to have different data for detail page
    viewModel.newsData = {
      'data': [
        {
          'attributes': {
            'judul': 'Berita 1',
            'deskripsi': 'Deskripsi Berita 1',
            'gambar': 'https://example.com/image1.jpg',
          },
        },
        {
          'attributes': {
            'judul': 'Berita 2',
            'deskripsi': 'Deskripsi Berita 2',
            'gambar': 'https://example.com/image2.jpg',
          },
        },
      ],
    };

    // Navigate back to the HomeScreen
    Navigator.pop(tester.allElements as BuildContext);

    // Ensure that the first item is displayed again
    expect(find.text('Berita 1'), findsOneWidget);
    expect(find.text('Deskripsi Berita 1...'), findsOneWidget);
  });
}
