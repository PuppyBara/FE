class ShelterDog {
  final ShelterDogInfo shelterDogInfo;
  final EtcInfo etcInfo;
  final ShelterInfo shelterInfo;

  ShelterDog(
      {required this.shelterDogInfo,
      required this.etcInfo,
      required this.shelterInfo});

  factory ShelterDog.fromJson(Map<String, dynamic> json) {
    return ShelterDog(
      shelterDogInfo: ShelterDogInfo.fromJson(json['shelterDogInfo']),
      etcInfo: EtcInfo.fromJson(json['etcInfo']),
      shelterInfo: ShelterInfo.fromJson(json['shelterInfo']),
    );
  }
}

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
  final bool neutering;

  ShelterDogInfo({
    required this.dogId,
    required this.noticeNo,
    required this.noticeSdt,
    required this.noticeEdt,
    required this.breed,
    required this.sex,
    required this.color,
    required this.feature,
    required this.age,
    required this.image,
    required this.neutering,
  });

  factory ShelterDogInfo.fromJson(Map<String, dynamic> json) {
    return ShelterDogInfo(
      dogId: json['dogId'],
      noticeNo: json['noticeNo'],
      noticeSdt: DateTime.parse(json['noticeSdt']),
      noticeEdt: DateTime.parse(json['noticeEdt']),
      breed: json['breed'],
      sex: json['sex'],
      color: json['color'],
      feature: json['feature'],
      age: json['age'],
      image: json['image'],
      neutering: json['neutering'],
    );
  }
}

class EtcInfo {
  final String location;
  final DateTime dateTime;

  EtcInfo({required this.location, required this.dateTime});

  factory EtcInfo.fromJson(Map<String, dynamic> json) {
    return EtcInfo(
      location: json['location'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}

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
