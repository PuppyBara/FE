import 'dart:convert';

import 'package:frontend/models/my_missing_dog/missing_dog.dart';
import 'package:frontend/models/my_missing_dog/missing_dog_list_model.dart';
import 'package:frontend/models/my_protected_dog/protected_dog_list_model.dart';
import 'package:frontend/screens/ai_screen/ai_search_select_screen.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class MyDogsService {
  static const String baseUrl = 'http://43.200.141.126/api';

  Future<MissingDogListModel> getMyMissingDog() async {
    const url = '$baseUrl/my/missing-dog';
    String? token = await getAccessToken();

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('호출서비스$data');
      if (data['myMissingDogs'] is List) {
        return MissingDogListModel.fromJson(data);
      } else {
        throw Exception(
            'Data is not in expected format: List expected for myMissingDogs');
      }
    } else {
      throw Exception('Failed to load my missing dog info');
    }
  }

  Future<ProtectedDogList> getMyProtectingDog() async {
    const url = '$baseUrl/my/protected-dog';
    String? token = await getAccessToken();

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['myMissingDogs'] is List) {
        return ProtectedDogList.fromJson(data);
      } else {
        throw Exception(
            'Data is not in expected format: List expected for getMyProtectingDog');
      }
    } else {
      throw Exception('Failed to load my protecting dog info');
    }
  }
}
