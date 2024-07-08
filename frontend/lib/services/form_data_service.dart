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
      'missingDogInfo.image':
          await MultipartFile.fromFile(dogInfo.image, filename: 'upload.jpg'),
      'missingDogInfo.name': dogInfo.name,
      'missingDogInfo.age': dogInfo.age.toString(),
      'missingDogInfo.breed': dogInfo.breed,
      'missingDogInfo.sex': dogInfo.sex,
      'missingDogInfo.color': dogInfo.color,
      'missingDogInfo.isNeutering': dogInfo.isNeutering.toString(),
      'missingDogInfo.feature': dogInfo.feature,
      'etcInfo.location': etcInfo.location,
      'etcInfo.dateTime': formatDateTime(etcInfo.dateTime),
    });

    print('FormData: ${formData.fields}'); // FormData 내용 출력

    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };

    try {
      Response response =
          await dio.post('$baseUrl/member/missing-dog', data: formData);

      if (response.statusCode == 200) {
        print('실종견 정보가 성공적으로 제출되었습니다.');
      } else {
        print('Failed to submit my missing dog info');
      }
    } catch (e) {
      print('실종견 정보 제출에 실패했습니다: $e');
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
