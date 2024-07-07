class ProtectedDogModel {
  final int id;
  final String image;
  final String sex;
  final DateTime dateTime;
  final String location;
  final String whoProtected;

  ProtectedDogModel({
    required this.id,
    required this.image,
    required this.sex,
    required this.dateTime,
    required this.location,
    required this.whoProtected,
  });

  factory ProtectedDogModel.fromJson(Map<String, dynamic> json) {
    return ProtectedDogModel(
      id: json['id'],
      image: json['image'],
      sex: json['sex'],
      dateTime: DateTime.parse(json['dateTime']),
      location: json['location'],
      whoProtected: json['whoProtected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'sex': sex,
      'dateTime': dateTime.toIso8601String(),
      'location': location,
      'whoProtected': whoProtected,
    };
  }
}
