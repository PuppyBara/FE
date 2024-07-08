import 'dart:convert';
import 'package:frontend/models/shelter/shelter_list_model.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_detail_model.dart';
import 'package:frontend/models/shelter_puppy/shelterDog.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class ShelterService {
  Future<List<ShelterDogDetailModel>> postShelterDogs(List<int> list) async {
    const baseUrl = 'http://43.200.141.126/api';
    final token = await getAccessToken();

    final response = await http.post(
      Uri.parse('$baseUrl/shelter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'searchIds': list,
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList =
          json.decode(utf8.decode(response.bodyBytes))['shelterDogs'];
      List<ShelterDogDetailModel> dogs =
          jsonList.map((json) => ShelterDogDetailModel.fromJson(json)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load shelter dogs');
    }
  }

  Future<ShelterListModel> getShelters() async {
    const baseUrl = 'http://43.200.141.126/api';
    final token = await getAccessToken();

    final response = await http.get(
      Uri.parse('$baseUrl/shelter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return ShelterListModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load shelters');
    }
  }
}
