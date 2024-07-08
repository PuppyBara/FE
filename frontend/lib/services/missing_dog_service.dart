import 'dart:convert';

import 'package:frontend/models/missingdog_id/missing_dog_model.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class MissingDogService {
  static const String baseUrl = 'http://43.200.141.126/api';

  Future<MissingDogModel> getMissingDogs() async {
    const url = '$baseUrl/missing-dog/1';
    String? token = await getAccessToken();

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      print('잃어버린개공고$data');
      if (data['missingDogs'] is List) {
        return MissingDogModel.fromJson(data);
      } else {
        throw Exception(
            'Data is not in expected format: List expected for missingDogService');
      }
    } else {
      throw Exception('Failed to load missing dogs info');
    }
  }
}
