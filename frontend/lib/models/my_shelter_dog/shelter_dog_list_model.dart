// 기업 내 보호 강아지 목록 조회
import 'shelter_dog.dart';

class ShelterDogModel {
  final List<ShelterDog> myShelterDogs;

  ShelterDogModel({required this.myShelterDogs});

  factory ShelterDogModel.fromJson(Map<String, dynamic> json) {
    var list = json['myShelterDogs'] as List;
    List<ShelterDog> shelterDogList =
        list.map((i) => ShelterDog.fromJson(i)).toList();

    return ShelterDogModel(myShelterDogs: shelterDogList);
  }
}
