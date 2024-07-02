// 상세보기 조회1

class ShelterDogInfo {
  final String noticeNo;
  final DateTime noticeSdt;
  final DateTime noticeEdt;
  final String image;
  final String breed;
  final String sex;
  final String color;
  final bool isNeutering;
  final String feature;

  ShelterDogInfo({
    required this.noticeNo,
    required this.noticeSdt,
    required this.noticeEdt,
    required this.image,
    required this.breed,
    required this.sex,
    required this.color,
    required this.isNeutering,
    required this.feature,
  });

  factory ShelterDogInfo.fromJson(Map<String, dynamic> json) {
    return ShelterDogInfo(
      noticeNo: json['noticeNo'],
      noticeSdt: DateTime.parse(json['noticeSdt']),
      noticeEdt: DateTime.parse(json['noticeEdt']),
      image: json['image'],
      breed: json['breed'],
      sex: json['sex'],
      color: json['color'],
      isNeutering: json['isNeutering'],
      feature: json['feature'],
    );
  }
}
