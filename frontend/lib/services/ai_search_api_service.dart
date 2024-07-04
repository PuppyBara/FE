import 'dart:convert';

import 'package:frontend/models/shelter_dog_id/etc_info_model.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_detail_model.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_info.dart';
import 'package:http/http.dart' as http;

class AiSearchApiService {
  static const String baseUrl = 'http://43.200.141.126/api';

  static Future<ShelterDogDetailModel> getDetailDogInfo(String id) async {
    final url = '$baseUrl/shelter/shelter-dog/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ShelterDogDetailModel.fromJson(data['shelterDogInfo']);
    } else {
      throw Exception('Failed to load shelter dog info');
    }
  }
}
