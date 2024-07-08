// 상세보기 조회1

class ShelterDogInfo {
  final String noticeNo;
  final DateTime noticeSdt;
  final DateTime noticeEdt;
  final String image;
  final String breed;
  final String sex;
  final String color;
  final bool neutering;
  final String feature;
  final int dogId;
  final int age;

  ShelterDogInfo({
    required this.noticeNo,
    required this.noticeSdt,
    required this.noticeEdt,
    required this.image,
    required this.breed,
    required this.sex,
    required this.color,
    required this.neutering,
    required this.feature,
    required this.age,
    required this.dogId,
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
        neutering: json['neutering'],
        feature: json['feature'],
        age: json['age'],
        dogId: json['dogId']);
  }
}
