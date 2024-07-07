import 'package:dio/dio.dart';
import 'package:frontend/models/member_missing_dog/missing_dog_model.dart'
    as missing_dog;
import 'package:frontend/models/member_protected_dog/protecting_dog_model.dart'
    as protecting_dog;
import 'package:frontend/services/getAccessToken.dart';

class FormDataService {
  final String baseUrl = "hhttp://43.200.141.126/api";

  Future<void> postMissingDog(
      missing_dog.MissingDogInfo dogInfo, missing_dog.EtcInfo etcInfo) async {
    Dio dio = Dio();

    final token = await getAccessToken();

    FormData formData = FormData.fromMap({
      'image':
          await MultipartFile.fromFile(dogInfo.image, filename: 'upload.jpg'),
      'name': dogInfo.name,
      'age': dogInfo.age,
      'breed': dogInfo.breed,
      'sex': dogInfo.sex,
      'color': dogInfo.color,
      'isNeutering': dogInfo.isNeutering,
      'feature': dogInfo.feature,
      'location': etcInfo.location,
      'dateTime': etcInfo.dateTime.toIso8601String(),
    });

    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };

    Response response =
        await dio.post('$baseUrl/member/missing-dog', data: formData);

    if (response.statusCode != 200) {
      throw Exception('Failed to submit my missing dog info');
    }
  }

  Future<void> postProtectedDog(protecting_dog.ProtectedDogInfo dogInfo,
      protecting_dog.EtcInfo etcInfo) async {
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'image':
          await MultipartFile.fromFile(dogInfo.image, filename: 'upload.jpg'),
      'breed': dogInfo.breed,
      'sex': dogInfo.sex,
      'color': dogInfo.color,
      'isNeutering': dogInfo.isNeutering,
      'feature': dogInfo.feature,
      'location': etcInfo.location,
      'dateTime': etcInfo.dateTime.toIso8601String(),
    });

    Response response =
        await dio.post('$baseUrl/protected-dog', data: formData);

    if (response.statusCode != 200) {
      throw Exception('Failed to submit protected dog info');
    }
  }
}
