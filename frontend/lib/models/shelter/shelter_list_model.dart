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

  List<String> getAllRegions() {
    return ['서울', '경기', '인천', '대전세종충청', '부산대구경상', '광주전라', '강원', '제주'];
  }

  // 지역별 보호소 이름 맵 가져오기
  Map<String, List<String>> getAllSheltersByRegion() {
    Map<String, List<String>> sheltersByRegion = {};
    sheltersByRegion['서울'] = seoul.map((s) => s.name).toList();
    sheltersByRegion['경기'] = gyeonggi.map((s) => s.name).toList();
    sheltersByRegion['인천'] = incheon.map((s) => s.name).toList();
    sheltersByRegion['대전세종충청'] =
        daejeonSejongChungcheong.map((s) => s.name).toList();
    sheltersByRegion['부산대구경상'] =
        busanDaeguGyeongsang.map((s) => s.name).toList();
    sheltersByRegion['광주전라'] = gwangjuJeolla.map((s) => s.name).toList();
    sheltersByRegion['강원'] = gangwon.map((s) => s.name).toList();
    sheltersByRegion['제주'] = jeju.map((s) => s.name).toList();
    return sheltersByRegion;
  }
}
