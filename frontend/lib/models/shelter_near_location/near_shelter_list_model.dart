import 'etc_info.dart';
import 'shelter_dog_info.dart';

class NearShelterListModel {
  final EtcInfo etcInfo;
  final ShelterDogInfo shelterDogInfo;

  NearShelterListModel({required this.etcInfo, required this.shelterDogInfo});

  factory NearShelterListModel.fromJson(Map<String, dynamic> json) {
    return NearShelterListModel(
      etcInfo: json["etcInfo"],
      shelterDogInfo: json["shelterDogInfo"],
    );
  }
}
