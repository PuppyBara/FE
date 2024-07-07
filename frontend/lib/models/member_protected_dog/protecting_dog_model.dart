class ProtectedDogInfo {
  final String image;
  final String breed;
  final String sex;
  final String color;
  final bool isNeutering;
  final String feature;

  ProtectedDogInfo({
    required this.image,
    required this.breed,
    required this.sex,
    required this.color,
    required this.isNeutering,
    required this.feature,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'breed': breed,
      'sex': sex,
      'color': color,
      'isNeutering': isNeutering,
      'feature': feature,
    };
  }
}

class EtcInfo {
  final String location;
  final DateTime dateTime;

  EtcInfo({
    required this.location,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
