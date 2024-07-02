// 기업에서 보호중인 강아지 목록 조회1
class ShelterDog {
  final int id;
  final String image;
  final String sex;
  final String breed;
  final DateTime dateTime;
  final String location;

  ShelterDog({
    required this.id,
    required this.image,
    required this.sex,
    required this.breed,
    required this.dateTime,
    required this.location,
  });

  factory ShelterDog.fromJson(Map<String, dynamic> json) {
    return ShelterDog(
        id: json["id"],
        image: json["image"],
        sex: json["sex"],
        breed: json["breed"],
        dateTime: DateTime.parse(json["dateTime"]),
        location: json["location"]);
  }
}
