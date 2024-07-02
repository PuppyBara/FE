class ProtectedDog {
  final int id;
  final String image;
  final String sex;
  final String breed;
  final DateTime dateTime;
  final String location;

  ProtectedDog(
      {required this.id,
      required this.image,
      required this.sex,
      required this.breed,
      required this.dateTime,
      required this.location});

  factory ProtectedDog.fromJson(Map<String, dynamic> json) {
    return ProtectedDog(
        id: json["id"],
        image: json["image"],
        sex: json["sex"],
        breed: json["breed"],
        dateTime: DateTime.parse(json["dateTime"]),
        location: json["location"]);
  }
}
