class MissingDog {
  final int id;
  final String image;
  final String sex;
  final String name;
  final String age;
  final DateTime dateTime;
  final String location;

  MissingDog(
      {required this.id,
      required this.image,
      required this.sex,
      required this.name,
      required this.age,
      required this.dateTime,
      required this.location});

  factory MissingDog.fromJson(Map<String, dynamic> json) {
    return MissingDog(
        id: json["id"],
        image: json["image"],
        sex: json["sex"],
        name: json["name"],
        age: json["age"],
        dateTime: DateTime.parse(json["dateTime"]),
        location: json["location"]);
  }
}
