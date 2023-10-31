import 'package:flutter/material.dart';
import 'package:mini_project_agatha/screen/view/login.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_ai.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_berita.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_login.dart';
import 'package:mini_project_agatha/screen/view_model/view_model_siswa.dart';
import 'package:provider/provider.dart';

void main() async {
  final loginViewModel = LoginViewModel();
  final siswaViewModel = SiswaViewModel();
  final beritaViewModel = BeritaViewModel();
  runApp(
   const MyApp()
  );
  await beritaViewModel.berita();
  await siswaViewModel.dataSiswa();
  await loginViewModel.checkSharedPreferences();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
    providers: [
      
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => AiViewModel()),
      ChangeNotifierProvider(create: (_) => SiswaViewModel()),
      ChangeNotifierProvider(create: (_) => BeritaViewModel()),
    ],
    child:   MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF21ABA5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    )
  );
  
  }
}