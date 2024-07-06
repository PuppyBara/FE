import 'dart:convert';
import 'package:frontend/models/shelter/shelter_list_model.dart';
import 'package:frontend/models/shelter_puppy/shelterDog.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class ShelterService {
  Future<List<ShelterDog>> postShelterDogs(List<String> list) async {
    const baseUrl = 'http://43.200.141.126/api';
    final token = getAccessToken();

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
      List<dynamic> jsonList = json.decode(response.body)['shelterDogs'];
      List<ShelterDog> dogs =
          jsonList.map((json) => ShelterDog.fromJson(json)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load shelter dogs');
    }
  }

  Future<ShelterListModel> getShelters() async {
    const baseUrl = 'http://43.200.141.126/api';
    final response = await http.get(Uri.parse('$baseUrl/shelter'));
    if (response.statusCode == 200) {
      return ShelterListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load shelters');
    }
  }
}
