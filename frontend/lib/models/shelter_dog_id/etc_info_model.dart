// 상세조회 2

class EtcInfo {
  final String location;
  final DateTime dateTime;

  EtcInfo({
    required this.location,
    required this.dateTime,
  });

  factory EtcInfo.fromJson(Map<String, dynamic> json) {
    return EtcInfo(
      location: json['location'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
