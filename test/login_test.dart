// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_agatha/screen/view/login.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:provider/provider.dart';
// import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
// import 'package:provider/provider.dart';

// class FakeDio extends Dio {
//   @override
//   Future<Response> post(String path, {dynamic data, Options? options}) {
//     final fakeResponse = Response(
//       statusCode: 200,
//       data: {
//         'user': {
//           'username': 'agataputra32@gmail.com',
//           'nip': '12345',
//           // 'foto_profile': 'profile.jpg',
//         },
//         'jwt': 'your_fake_jwt_token',
//       },
//       requestOptions: RequestOptions(path: path),
//     );

//     // Gantilah dengan logika yang mengembalikan respons palsu
//     return Future.value(fakeResponse);
//   }
// }
// void main() {
//   testWidgets('Test Login', (WidgetTester tester) async {

//     final viewModel = LoginViewModel();

//     await tester.pumpWidget(
//       MaterialApp(
//         home: MultiProvider(
//           providers: [
//             ChangeNotifierProvider.value(value: viewModel),
//           ],
//           child: const LoginScreen(),
//         ),
//       ),
//     );

//     // Mencari widget TextField untuk email
//     final emailField = find.widgetWithText(TextField, 'Email');
//     expect(emailField, findsOneWidget);

//     // Mencari widget TextField untuk password
//     final passwordField = find.widgetWithText(TextField, 'Password');
//     expect(passwordField, findsOneWidget);

//     // Memasukkan email dan kata sandi
//     await tester.enterText(emailField, 'agataputra32@gmail.com');
//     await tester.enterText(passwordField, 'agatha123');

//     // Mencari tombol Login
//     final loginButton = find.widgetWithText(ElevatedButton, 'Login');
//     expect(loginButton, findsOneWidget);

//     // Mengklik tombol Login
//     await tester.tap(loginButton);
//     await tester.pumpAndSettle();

//     // Mengecek apakah navigasi dilakukan ke halaman Home
//     expect(find.text('Home Screen'), findsOneWidget);
//   });
// }

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    final loginViewModel = LoginViewModel();
    //LoginScreen(),
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => loginViewModel,
          child: const LoginScreen(),
        ),
      ),
    );
    final emailField = find.widgetWithText(TextField, 'Email');
    final passwordField = find.widgetWithText(TextField, 'Password');
    // final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    // final textCobaFinder = find.text("coba");
    // final textLogin = find.text("Login");

    // expect(textCobaFinder, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    // expect(loginButton, findsOneWidget);
    // expect(textLogin, findsOneWidget);

    // final appBarFinder = find.byType(AppBar);
    // final titleFinder = find.text("Login");
    // expect(appBarFinder, findsOneWidget);
    // expect(titleFinder, findsOneWidget);
    // final imageFinder = find.byType(Image);
    // final emailTextFieldFinder = find.byType(TextField).at(0);
    // final passwordTextFieldFinder = find.byType(TextField).at(1);
    // final loginButtonFinder = find.text('Login');

    //  expect(imageFinder, findsOneWidget);
    // expect(emailTextFieldFinder, findsOneWidget);
    // expect(passwordTextFieldFinder, findsOneWidget);
    // expect(loginButtonFinder, findsOneWidget);

    // await tester.enterText(emailTextFieldFinder, 'test@example.com');
    // await tester.enterText(passwordTextFieldFinder, 'password');

    // await tester.tap(loginButtonFinder);
    // await tester.pump();

    // You can add additional assertions to check the expected behavior of your UI
  });
}
