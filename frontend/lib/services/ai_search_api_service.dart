import 'dart:convert';

import 'package:frontend/models/ai_result/ai_result_list_model.dart';
import 'package:frontend/models/shelter_dog_id/etc_info_model.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_detail_model.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_info.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class AiSearchApiService {
  static const String baseUrl = 'http://43.200.141.126/api';

  static Future<ShelterDogDetailModel> getDetailDogInfo(String id) async {
    final url = '$baseUrl/shelter/shelter-dog/$id';
    String? token = await getAccessToken();

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return ShelterDogDetailModel.fromJson(data['shelterDogInfo']);
    } else {
      throw Exception('Failed to load shelter dog info');
    }
  }

  static Future<AiResultListModel> getAiSearchResult(
      String id, int upperBound) async {
    final url = '$baseUrl/search/ai?dogId=$id&upperBound=$upperBound';
    String? token = await getAccessToken();

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AiResultListModel.fromJson(data['shelterDogInfo']);
    } else {
      throw Exception('Failed to load ai search dog info');
    }
  }
}
