import 'ai_result_dog.dart';

class AiResultListModel {
  final List<AiResultDog> aiResultDogs;

  AiResultListModel({required this.aiResultDogs});

  factory AiResultListModel.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List;
    List<AiResultDog> resultDogList =
        list.map((i) => AiResultDog.fromJson(i)).toList();

    return AiResultListModel(aiResultDogs: resultDogList);
  }
}
