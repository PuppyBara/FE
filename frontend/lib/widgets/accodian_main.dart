import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:frontend/models/my_missing_dog/missing_dog_list_model.dart';
import 'package:frontend/models/my_protected_dog/protected_dog_list_model.dart';
import 'package:frontend/services/my_dogs_service.dart';

class AccodianMain extends StatefulWidget {
  const AccodianMain({super.key});

  @override
  _AccodianMainState createState() => _AccodianMainState();
}

class _AccodianMainState extends State<AccodianMain> {
  int _expandedIndex = -1; // 현재 확장된 아코디언의 인덱스를 저장하는 변수
  late Future<MissingDogListModel> myMissingDogs;
  late Future<ProtectedDogList> myProtectingDog;

  @override
  void initState() {
    super.initState();
    myMissingDogs = MyDogsService().getMyMissingDog();
    myProtectingDog = MyDogsService().getMyProtectingDog();
  }

  @override
  Widget build(BuildContext context) {
    const Color customBlack = Color.fromRGBO(58, 58, 58, 1);
    const Color customGrey = Color.fromRGBO(115, 115, 115, 1);

    return Column(
      children: [
        FutureBuilder<MissingDogListModel>(
            future: myMissingDogs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var dog = snapshot.data!.myMissingDogs[0];
                return ExpandableCard(
                  header: const ExpandableCardText(
                    titleText: "등록한 실종공고",
                    customBlack: customBlack,
                    imgUrl: 'assets/images/cameraOrange.png',
                  ),
                  isExpanded: _expandedIndex == 0,
                  onTap: () {
                    setState(() {
                      _expandedIndex = _expandedIndex == 0 ? -1 : 0;
                    });
                  },
                  expandedChild: ExpandableCardContent(
                    image: dog.image,
                    name: dog.name,
                    age: dog.age,
                    location: dog.location,
                    date: dog.dateTime.substring(0, 10),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Text("No data");
              }
            }),
        const SizedBox(height: 10),
        FutureBuilder<ProtectedDogList>(
            future: myProtectingDog,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var dog = snapshot.data!.myProtectedDogs[0];
                return ExpandableCard(
                  header: const ExpandableCardText(
                    titleText: "등록한 보호동물",
                    customBlack: customBlack,
                    imgUrl: 'assets/images/cameraGreen.png',
                  ),
                  isExpanded: _expandedIndex == 1,
                  onTap: () {
                    setState(() {
                      _expandedIndex = _expandedIndex == 1 ? -1 : 1;
                    });
                  },
                  expandedChild: ExpandableCardContent(
                    image: dog.image,
                    name: dog.breed,
                    location: dog.location,
                    date: dog.dateTime.toString().substring(0, 10),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Text("No data");
              }
            }),
      ],
    );
  }
}

class ExpandableCardContent extends StatelessWidget {
  const ExpandableCardContent({
    super.key,
    required this.image,
    this.age,
    required this.name,
    required this.date,
    required this.location,
  });

  final String image;
  final int? age;
  final String name;
  final String date;
  final String location;

  @override
  Widget build(BuildContext context) {
    const Color customBlack = Color.fromRGBO(58, 58, 58, 1);
    const Color customGrey = Color.fromRGBO(115, 115, 115, 1);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    width: 127,
                    height: 80,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: customBlack,
                        ),
                      ),
                      if (age != null) ...[
                        Text(
                          ' (${age!})살',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 13.65,
                        color: customBlack,
                      ),
                      Text(
                        date.substring(0, 10),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: customBlack,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableCardText extends StatelessWidget {
  const ExpandableCardText({
    super.key,
    required this.customBlack,
    required this.titleText,
    required this.imgUrl,
  });

  final Color customBlack;
  final String titleText;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imgUrl,
          width: 20,
          height: 18,
        ),
        const SizedBox(width: 8),
        Text(
          titleText,
          style: TextStyle(
            color: customBlack,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class ExpandableCard extends StatelessWidget {
  final Widget header;
  final Widget expandedChild;
  final bool isExpanded;
  final Function onTap;

  const ExpandableCard({
    super.key,
    required this.header,
    required this.isExpanded,
    required this.onTap,
    required this.expandedChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: isExpanded ? 200 : null, // 확장 시 세로 길이
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              title: header,
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onTap: () => onTap(),
            ),
            if (isExpanded) expandedChild,
          ],
        ),
      ),
    );
  }
}
