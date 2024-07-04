class AiResultDog {
  final String id;
  final String image;
  final String sex;
  final String dateTime;
  final String location;
  final String whoProtected;
  final int percentage;
  final String aiType;

  AiResultDog({
    required this.id,
    required this.image,
    required this.sex,
    required this.dateTime,
    required this.location,
    required this.whoProtected,
    required this.percentage,
    required this.aiType,
  });

  factory AiResultDog.fromJson(Map<String, dynamic> json) {
    return AiResultDog(
        id: json["id"],
        image: json["image"],
        sex: json["sex"],
        dateTime: json["dateTime"],
        location: json["location"],
        whoProtected: json["whoProtected"],
        percentage: json["percentage"],
        aiType: json["aiType"]);
  }
}
