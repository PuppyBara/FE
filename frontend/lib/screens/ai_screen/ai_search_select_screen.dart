import 'package:flutter/material.dart';
import 'package:frontend/models/my_missing_dog/missing_dog_list_model.dart';
import 'package:frontend/my_flutter_app_icons.dart';
import 'package:frontend/screens/ai_screen/ai_select_range_screen.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/services/my_dogs_service.dart';
import 'package:frontend/widgets/aiSearchProgress.dart';
import 'package:frontend/models/my_missing_dog/missing_dog.dart';

class AiSearchSelectScreen extends StatefulWidget {
  const AiSearchSelectScreen({super.key});

  @override
  _AiSearchSelectScreenState createState() => _AiSearchSelectScreenState();
}

class _AiSearchSelectScreenState extends State<AiSearchSelectScreen> {
  late int selectedDogIndex;

  late Future<MissingDogListModel> myMissingDogs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myMissingDogs = MyDogsService().getMyMissingDog();
    selectedDogIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AiSearchProgress(
              progressText: "반려견을 선택해주세요.",
              selectNum: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FutureBuilder<MissingDogListModel>(
                  future: myMissingDogs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dogs = snapshot.data!.myMissingDogs;
                      return SizedBox(
                        height: dogs.length * 150,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: dogs.length,
                          itemBuilder: (context, index) {
                            final dog = dogs[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDogIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.08),
                                      spreadRadius: 2,
                                      blurRadius: 28,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  border: Border.all(
                                    width: 5,
                                    color: selectedDogIndex == index
                                        ? Colors.orange
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1.7,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.network(
                                              dog.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.all(
                                              4), // 아이콘과 이미지 경계의 여백
                                          decoration: BoxDecoration(
                                            color: dog.sex == 'Female'
                                                ? customGreen
                                                : customOrange, // 아이콘 배경색
                                            shape: BoxShape.circle, // 원형으로 만들기
                                          ),
                                          child: Icon(
                                            dog.sex == 'Female'
                                                ? MyFlutterApp.vector
                                                : MyFlutterApp.vector__1_,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          dog.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          ' (${dog.age}살)',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Color.fromRGBO(
                                                  115, 115, 115, 1)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          size: 13,
                                        ),
                                        Text(
                                          dog.dateTime.substring(0, 10),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  58, 58, 58, 1)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 14,
                                        ),
                                        Text(
                                          dog.location,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  58, 58, 58, 1)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('AI 분석 페이지에서 내 강아지 데이터를 불러오지 못했습니다.');
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AiSearchSelectRange(dogId: selectedDogIndex))),
              child: const Text(
                "다음으로 >> ",
                style: TextStyle(
                  color: Color.fromRGBO(83, 83, 83, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
