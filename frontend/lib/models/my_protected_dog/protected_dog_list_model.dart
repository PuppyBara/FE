import 'protected_dog.dart';

class ProtectedDogList {
  final List<ProtectedDog> myProtectedDogs;

  ProtectedDogList({required this.myProtectedDogs});

  factory ProtectedDogList.fromJson(Map<String, dynamic> json) {
    var list = json['myProtectedDogs'] as List;
    List<ProtectedDog> protectedDogList =
        list.map((i) => ProtectedDog.fromJson(i)).toList();

    return ProtectedDogList(myProtectedDogs: protectedDogList);
  }
}
