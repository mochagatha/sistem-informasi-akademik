import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utils/urls.dart';

class AiViewModel with ChangeNotifier {
  final TextEditingController ai = TextEditingController();
  List<dynamic> dataAi = [];
  Map<String, dynamic> keyAi = {};
  final Dio _dio = Dio();
   bool isLoading = true;

  AiViewModel() {
    tokenAI();
  }
  Future<void> tokenAI () async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.tokenGetAi);

      if (response.statusCode == 200) {
        final data = response.data;
        keyAi = data;
        isLoading = false;
      } else {
        debugPrint('Gagal mengambil data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
    }
  notifyListeners();
  }

  Future<void> makeApiRequest(BuildContext context, String key) async {
    // const authToken = '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';

    _dio.options = BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      headers: {
        'Authorization': 'Bearer $key',
      },
    );
    
  isLoading = true;
  notifyListeners();
    try {
      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "Kamu adalah seorang guru smp, kamu akan ditanyai hal seputar sekolah menengah pertama. ${ai.text}",
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );
          isLoading = false; // Setelah permintaan selesai
    notifyListeners();
      if (response.statusCode == 200) {
        final responseData = response.data;
        dataAi = responseData["choices"];
      } else {
        debugPrint('Failed to make API request: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
    notifyListeners();
  }
}
