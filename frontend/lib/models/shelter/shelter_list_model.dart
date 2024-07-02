// lib/models/animal_hospital_list.dart

import 'shelter.dart';

class ShelterListModel {
  final List<Shelter> seoul;
  final List<Shelter> gyeonggi;
  final List<Shelter> incheon;
  final List<Shelter> daejeonSejongChungcheong;
  final List<Shelter> busanDaeguGyeongsang;
  final List<Shelter> gwangjuJeolla;
  final List<Shelter> gangwon;
  final List<Shelter> jeju;

  ShelterListModel({
    required this.seoul,
    required this.gyeonggi,
    required this.incheon,
    required this.daejeonSejongChungcheong,
    required this.busanDaeguGyeongsang,
    required this.gwangjuJeolla,
    required this.gangwon,
    required this.jeju,
  });

  factory ShelterListModel.fromJson(Map<String, dynamic> json) {
    return ShelterListModel(
      seoul: (json['seoul'] as List).map((e) => Shelter.fromJson(e)).toList(),
      gyeonggi:
          (json['gyeonggi'] as List).map((e) => Shelter.fromJson(e)).toList(),
      incheon:
          (json['incheon'] as List).map((e) => Shelter.fromJson(e)).toList(),
      daejeonSejongChungcheong: (json['daejeonSejongChungcheong'] as List)
          .map((e) => Shelter.fromJson(e))
          .toList(),
      busanDaeguGyeongsang: (json['busanDaeguGyeongsang'] as List)
          .map((e) => Shelter.fromJson(e))
          .toList(),
      gwangjuJeolla: (json['gwangjuJeolla'] as List)
          .map((e) => Shelter.fromJson(e))
          .toList(),
      gangwon:
          (json['gangwon'] as List).map((e) => Shelter.fromJson(e)).toList(),
      jeju: (json['jeju'] as List).map((e) => Shelter.fromJson(e)).toList(),
    );
  }
}
