import 'dart:convert';
import 'package:frontend/models/shelter_puppy/shelterDog.dart';
import 'package:http/http.dart' as http;

class ShelterService {
  Future<List<ShelterDog>> getShelterDogs() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/shelterdogs'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['shelterDogs'];
      List<ShelterDog> dogs =
          jsonList.map((json) => ShelterDog.fromJson(json)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load shelter dogs');
    }
  }
}
