import 'missing_dog.dart';

class MissingDogListModel {
  final List<MissingDog> myMissingDogs;

  MissingDogListModel({required this.myMissingDogs});

  factory MissingDogListModel.fromJson(Map<String, dynamic> json) {
    var list = json['myMissingDogs'] as List;
    List<MissingDog> missingDogList =
        list.map((i) => MissingDog.fromJson(i)).toList();
    return MissingDogListModel(myMissingDogs: missingDogList);
  }
}
