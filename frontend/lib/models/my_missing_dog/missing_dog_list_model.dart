import 'missing_dog.dart';

class MissingDogListModel {
  final List<MissingDog> myMissingDogs;

  MissingDogListModel({required this.myMissingDogs});

  factory MissingDogListModel.fromJson(Map<String, dynamic> json) {
    var rawList = json['myMissingDogs'];
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
    return MissingDogListModel(myMissingDogs: missingDogList);
  }
}
