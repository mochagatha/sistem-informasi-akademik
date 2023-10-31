import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/daftar_siswa_model.dart';
import '../utils/urls.dart';

class SiswaApiService {
  final Dio _dio = Dio();

  Future<DaftarSiswaModel?> fetchDataSiswa() async {
    try {
      final options = BaseOptions(
        baseUrl: Urls.baseUrl,
      );
      _dio.options = options;

      final response = await _dio.get(Urls.student);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data;
        final DaftarSiswaModel daftarSiswaModel =
            daftarSiswaModelFromJson(jsonData);
        return daftarSiswaModel;
      } else {
        debugPrint('Gagal mengambil data. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
      return null;
    }
  }
}
