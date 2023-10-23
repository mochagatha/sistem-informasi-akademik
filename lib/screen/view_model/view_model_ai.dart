import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AiViewModel with ChangeNotifier {
  final TextEditingController ai = TextEditingController();
  List<dynamic> dataAi = [];
  final Dio _dio = Dio();

  Future<void> makeApiRequest(BuildContext context) async {
    const authToken = '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';

    _dio.options = BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );
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
