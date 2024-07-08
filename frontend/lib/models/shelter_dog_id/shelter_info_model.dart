class ShelterInfo {
  final int shelterId;
  final String name;
  final String tel;
  final String location;

  ShelterInfo(
      {required this.shelterId,
      required this.name,
      required this.tel,
      required this.location});

  factory ShelterInfo.fromJson(Map<String, dynamic> json) {
    return ShelterInfo(
      shelterId: json['shelterId'],
      name: json['name'],
      tel: json['tel'],
      location: json['location'],
    );
  }
}
