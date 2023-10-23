import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_agatha/utils/urls.dart';

class BeritaViewModel with ChangeNotifier {
  Map<String, dynamic> newsData = {};
  final Dio _dio = Dio();

  BeritaViewModel() {
    berita();
  }
  Future<void> berita() async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.berita);

      if (response.statusCode == 200) {
        final data = response.data;
        newsData = data;
      } else {
        debugPrint('Gagal mengambil data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
    }
    notifyListeners();
  }
}
