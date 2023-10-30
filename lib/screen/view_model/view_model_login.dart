import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_agatha/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_model_berita.dart';
import 'view_model_siswa.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordLama = TextEditingController();
  final TextEditingController passwordBaru = TextEditingController();
  final TextEditingController konfirmasiPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String name = "";
  String token = '';
  String nip = "";
  String fotoProfileUser = '';
  int currentIndex = 1;
  final Dio _dio = Dio();
  String gagalUbahPassword = 'Gagal Update Password';
  String berhasilUbahPassword = 'Berhasil Update Password';
  final siswaViewModel = SiswaViewModel();
  final beritaViewModel = BeritaViewModel();
  bool isPasswordVisible = false;
  bool isPasswordLama = false;
  bool isPasswordBaru = false;
  bool isKonfirmasiPassword = false;

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
        await beritaViewModel.berita();
        await siswaViewModel.dataSiswa();
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

  Future<bool> changePassword() async {
    _dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> data = {
      'currentPassword': passwordLama.text,
      'password': passwordBaru.text,
      'passwordConfirmation': konfirmasiPassword.text
    };

    try {
      Response response = await _dio.post(
        Urls.baseUrl + Urls.gantiPassword,
        data: data,
      );

      if (response.statusCode == 200) {
        debugPrint('Password berhasil diubah');
        return true;
      } else {
        debugPrint(
            'Gagal mengubah password. Status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan: $error');
      return false;
    }
  }

  String? validatePasswordBaru(String value) {
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length < 8) {
      return 'Password harus memiliki setidaknya 8 karakter';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
      return 'Password harus berupa kombinasi huruf dan angka';
    }
    return null;
  }

  String? validateKonfirmasiPassword(String value) {
    if (value.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    } else if (value != passwordBaru.text) {
      return 'Password tidak sama';
    }
    return null;
  }

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void togglePasswordLamaVisibility() {
    isPasswordLama = !isPasswordLama;
    notifyListeners();
  }

  void togglePasswordBaruVisibility() {
    isPasswordBaru = !isPasswordBaru;
    notifyListeners();
  }

  void toggleKonfirmasiPasswordVisibility() {
    isKonfirmasiPassword = !isKonfirmasiPassword;
    notifyListeners();
  }

  void hapus() {
    passwordLama.clear();
    passwordBaru.clear();
    konfirmasiPassword.clear();
    notifyListeners();
  }
}
