import 'dart:convert';
import 'package:frontend/models/my_protected_dog/protected_dog.dart';
import 'package:frontend/models/protected_dog_id/protected_dog_model.dart';
import 'package:frontend/services/getAccessToken.dart';
import 'package:http/http.dart' as http;

class ProtectedDogService {
  final String url = "http://43.200.141.126/api/protected-dog/1";

  Future<List<ProtectedDogModel>> getProtectedDogs() async {
    String? token = await getAccessToken();
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    print('보호중인개공고${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['protectedDogs'];
      List<ProtectedDogModel> dogs =
          body.map((dynamic item) => ProtectedDogModel.fromJson(item)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load protected dogs');
    }
  }
}
