// lib/models/animal_hospital.dart

class Shelter {
  final int id;
  final String name;
  final String tel;
  final String location;

  Shelter({
    required this.id,
    required this.name,
    required this.tel,
    required this.location,
  });

  factory Shelter.fromJson(Map<String, dynamic> json) {
    return Shelter(
      id: json['id'],
      name: json['name'],
      tel: json['tel'],
      location: json['location'],
    );
  }
}
