class ShelterDogInfo {
  final int dogId;
  final String noticeNo;
  final DateTime noticeSdt;
  final DateTime noticeEdt;
  final String breed;
  final String sex;
  final String color;
  final String feature;
  final int age;
  final String image;
  final bool isNeutering;

  ShelterDogInfo({
    required this.dogId,
    required this.noticeNo,
    required this.noticeSdt,
    required this.noticeEdt,
    required this.image,
    required this.breed,
    required this.sex,
    required this.color,
    required this.isNeutering,
    required this.age,
    required this.feature,
  });

  factory ShelterDogInfo.fromJson(Map<String, dynamic> json) {
    return ShelterDogInfo(
      dogId: json['dogId'],
      noticeNo: json['noticeNo'],
      noticeSdt: DateTime.parse(json['noticeSdt']),
      noticeEdt: DateTime.parse(json['noticeEdt']),
      image: json['image'],
      breed: json['breed'],
      sex: json['sex'],
      color: json['color'],
      isNeutering: json['isNeutering'],
      age: json['age'],
      feature: json['feature'],
    );
  }
}
