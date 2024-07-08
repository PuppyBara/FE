// 보호소 강아지 상세 조회

import 'etc_info_model.dart';
import 'shelter_dog_info.dart';
import 'shelter_info_model.dart';

class ShelterDogDetailModel {
  final ShelterDogInfo shelterDogInfo;
  final EtcInfo etcInfo;
  final ShelterInfo shelterInfo;

  ShelterDogDetailModel({
    required this.shelterDogInfo,
    required this.etcInfo,
    required this.shelterInfo,
  });

  factory ShelterDogDetailModel.fromJson(Map<String, dynamic> json) {
    return ShelterDogDetailModel(
        shelterDogInfo: ShelterDogInfo.fromJson(json['shelterDogInfo']),
        etcInfo: EtcInfo.fromJson(json['etcInfo']),
        shelterInfo: ShelterInfo.fromJson(json['shelterInfo']));
  }
}
