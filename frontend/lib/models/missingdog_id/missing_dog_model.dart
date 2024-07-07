import 'missing_dog.dart';

class MissingDogModel {
  final List<MissingDog> missingDogs;

  MissingDogModel({required this.missingDogs});

  factory MissingDogModel.fromJson(Map<String, dynamic> json) {
    var rawList = json['missingDogs'];
    if (rawList is! List<dynamic>) {
      throw Exception('Expected a list of dynamic types');
    }
    List<dynamic> list = rawList;
    List<MissingDog> missingDogList = list.map((item) {
      if (item is Map<String, dynamic>) {
        return MissingDog.fromJson(item);
      } else {
        throw Exception('Expected item to be a Map<String, dynamic>');
      }
    }).toList();
    return MissingDogModel(missingDogs: missingDogList);
  }
}
