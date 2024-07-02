class EtcInfo {
  final String location;
  final String dateTime;

  EtcInfo({
    required this.location,
    required this.dateTime,
  });

  factory EtcInfo.fromJson(Map<String, dynamic> json) {
    return EtcInfo(
      location: json["location"],
      dateTime: json["dateTime"],
    );
  }
}
