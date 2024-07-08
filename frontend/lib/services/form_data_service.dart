import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/member_missing_dog/missing_dog_model.dart'
    as missing_dog;
import 'package:frontend/models/member_protected_dog/protecting_dog_model.dart'
    as protecting_dog;
import 'package:frontend/services/getAccessToken.dart';
import 'package:intl/intl.dart';

class FormDataService {
  final String baseUrl = "http://43.200.141.126/api";

  Future<void> postMissingDog(
      missing_dog.MissingDogInfo dogInfo, missing_dog.EtcInfo etcInfo) async {
    Dio dio = Dio();

    final token = await getAccessToken();

    String formatDateTime(DateTime dateTime) {
      final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss");
      return formatter.format(dateTime);
    }

    // JSON 문자열로 변환
    // String dogInfoJson = jsonEncode({
    //   'image': '',
    //   'name': dogInfo.name,
    //   'age': dogInfo.age,
    //   'breed': dogInfo.breed,
    //   'sex': dogInfo.sex,
    //   'color': dogInfo.color,
    //   'isNeutering': dogInfo.isNeutering,
    //   'feature': dogInfo.feature,
    // });

    // String etcInfoJson = jsonEncode({
    //   'location': etcInfo.location,
    //   'dateTime': formatDateTime(etcInfo.dateTime),
    // });

    // FormData formData = FormData.fromMap({
    //   'image': await MultipartFile.fromFile(dogInfo.image,
    //       filename: '${dogInfo.image}picture.jpg'),
    //   'name': dogInfo.name,
    //   'age': dogInfo.age,
    //   'breed': dogInfo.breed,
    //   'sex': dogInfo.sex,
    //   'color': dogInfo.color,
    //   'isNeutering': dogInfo.isNeutering,
    //   'feature': dogInfo.feature,
    //   'location': etcInfo.location,
    //   'dateTime': formatDateTime(etcInfo.dateTime),
    // });

    // FormData에 추가
    // FormData formData = FormData.fromMap({
    //   'missingDogInfo': dogInfoJson,
    //   'etcInfo': etcInfoJson,
    //   'missingDogInfo.image':
    //       await MultipartFile.fromFile(dogInfo.image, filename: 'picture.jpg'),
    // });

    FormData formData = FormData.fromMap({
      'missingDogInfo': {
        'image':
            await MultipartFile.fromFile(dogInfo.image, filename: 'upload.jpg'),
        'name': dogInfo.name,
        'age': dogInfo.age,
        'breed': dogInfo.breed,
        'sex': dogInfo.sex,
        'color': dogInfo.color,
        'isNeutering': dogInfo.isNeutering,
        'feature': dogInfo.feature,
      },
      'etcInfo': {
        'location': etcInfo.location,
        'dateTime': formatDateTime(etcInfo.dateTime),
      }
    });

    print('FormData: ${formData.fields}'); // FormData 내용 출력

    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };

    Response response =
        await dio.post('$baseUrl/member/missing-dog', data: formData);

    print('요청결과${response.data}');

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
