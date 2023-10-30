import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/daftar_siswa_model.dart';
import '../../service/data_siswa_service.dart';
import '../../utils/urls.dart';

class SiswaViewModel with ChangeNotifier {
  final Dio _dio = Dio();
  bool isEditMode = false;
  final TextEditingController inputUh1 = TextEditingController();
  final TextEditingController inputUh2 = TextEditingController();
  final TextEditingController inputUh3 = TextEditingController();
  final TextEditingController inputUts = TextEditingController();
  final TextEditingController inputUas = TextEditingController();
  Map<String, dynamic> studentData = {};
  Map<String, dynamic> studentDataID = {};
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();


  final service = SiswaApiService();
   DaftarSiswaModel? siswaList;
  SiswaViewModel() {
    dataSiswa();
  }
  Future<void> dataSiswa() async {
    isLoading = true;
    notifyListeners();
    try {
      final data = await service.fetchDataSiswa();
      siswaList = data;
    } catch (error) {
       throw Exception('Gagal mengambil data dari API: $error');
    }
    isLoading = false;
    notifyListeners();
  }

  void addNilaiStudent(
      int idSiswa, int uh1, int uh2, int uh3, int uts, int uas) async {
    int ulanganHarian1 = int.tryParse(inputUh1.text) ?? uh1;
    int ulanganHarian2 = int.tryParse(inputUh2.text) ?? uh2;
    int ulanganHarian3 = int.tryParse(inputUh3.text) ?? uh3;
    int ulanganTengahSemester = int.tryParse(inputUts.text) ?? uts;
    int ulanganAkhirSemester = int.tryParse(inputUas.text) ?? uas;
    String apiUrl = Urls.baseUrl + Urls.addNilai + idSiswa.toString();

    Map<String, dynamic> requestBody = {
      "data": {
        "ulangan_harian_1": ulanganHarian1,
        "ulangan_harian_2": ulanganHarian2,
        "ulangan_harian_3": ulanganHarian3,
        "uts": ulanganTengahSemester,
        "uas": ulanganAkhirSemester,
      }
    };

    try {
      Response response = await _dio.put(apiUrl, data: requestBody);

      // Cek status kode respons
      if (response.statusCode == 200) {
        siswaById(idSiswa);
        await dataSiswa();

        notifyListeners();
      } else {
        debugPrint(
            "Gagal memperbarui data. Kode status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Terjadi kesalahan: $e");
    }
    notifyListeners();
  }

  Future<void> siswaById(int idSiswa) async {
    try {
      final dio = Dio();
      final options = BaseOptions(
        baseUrl: Urls.baseUrl,
      );
      dio.options = options;

      final response = await dio.get(Urls.addNilai + idSiswa.toString());

      if (response.statusCode == 200) {
        final data = response.data;
        studentDataID = data;
        notifyListeners();
      } else {
        debugPrint('Gagal mengambil data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
    }
    notifyListeners();
  }

  void toggleEditMode() {
    isEditMode = !isEditMode;
    notifyListeners();
  }
    String? validateNilai(String value) {
    if (value.isNotEmpty) {
      final intValue = int.tryParse(value);
      if (intValue == null || intValue < 0 || intValue > 100) {
        return 'Masukkan angka antara 0 hingga 100';
      }
    }
    return null;
  }
}
