import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_agatha/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String name = "";
  String token = '';
  String nip = "";
  String fotoProfileUser = '';
  int currentIndex = 1;
  final Dio _dio = Dio();

  LoginViewModel() {
    checkSharedPreferences();
  }
  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.authUrl,
        data: {
          'identifier': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final responseData = response.data['user'];
        token = response.data['jwt'];
        name = responseData['username'];
        nip = responseData['nip'];
        fotoProfileUser = responseData['foto_profile'];

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', token);
        prefs.setString('username', name);
        prefs.setString('nip', nip);
        prefs.setString('foto_profile', fotoProfileUser);

        // print('Username: $username');
        notifyListeners();
        return true;
      } else {
        debugPrint('Login gagal: ${response.data}');
        return false;
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }

  Future<void> checkSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedJWT = prefs.getString('jwt');
    final storedNip = prefs.getString('nip');
    final storedFoto = prefs.getString('foto_profile');

    name = storedUsername!;
    token = storedJWT!;
    nip = storedNip!;
    fotoProfileUser = storedFoto!;
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
