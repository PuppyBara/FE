import 'package:flutter/material.dart';
import 'package:frontend/my_flutter_app_icons.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/widgets/make_text_button.dart';
import 'package:frontend/widgets/make_text_list.dart';
import 'package:frontend/services/shelter_service.dart';

class ShelterSearchResultScreen extends StatefulWidget {
  ShelterSearchResultScreen(
      {super.key,
      required this.selectedShelter,
      required this.shelterName,
      required this.shelterTel,
      required this.shelterLocation});

  late List<int> selectedShelter;
  late String shelterName;
  late String shelterTel;
  late String shelterLocation;

  @override
  State<ShelterSearchResultScreen> createState() =>
      _ShelterSearchResultScreenState();
}

class _ShelterSearchResultScreenState extends State<ShelterSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "보호소 전체 공고",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ShelterAnnounceWidget(
        selectedShelter: widget.selectedShelter,
        shelterLocation: widget.shelterLocation,
        shelterName: widget.shelterName,
        shelterTel: widget.shelterTel,
      ),
    );
  }
}

class ShelterAnnounceWidget extends StatelessWidget {
  const ShelterAnnounceWidget(
      {super.key,
      required this.selectedShelter,
      required this.shelterName,
      required this.shelterTel,
      required this.shelterLocation});
  final List<int> selectedShelter;
  final String shelterName;
  final String shelterTel;
  final String shelterLocation;

  @override
  Widget build(BuildContext context) {
    final shelterService = ShelterService().postShelterDogs(selectedShelter);
    return FutureBuilder(
        future: shelterService,
        builder: (context, snapshot) {
          print('공고데이터${snapshot.data}');
          if (snapshot.hasData) {
            var resultDogs = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Divider(
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/puppyProfile.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        MyFlutterApp.logo,
                        size: 17,
                        color: customGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$shelterName에 등록된 공고예요",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(235, 235, 235, 1),
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                shelterLocation,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              MyFlutterApp.call,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(shelterTel),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  resultDogs.isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          child: Text(
                            "등록된 공고가 없어요",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ))
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 0,
                              ),
                              child: SizedBox(
                                height: resultDogs.length * 110,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.95,
                                  ),
                                  itemCount: resultDogs.length,
                                  itemBuilder: (context, index) {
                                    final dog = resultDogs[index];
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.08),
                                            spreadRadius: 2,
                                            blurRadius: 28,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    dog.shelterDogInfo.image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                margin: const EdgeInsets.all(
                                                    4), // 아이콘과 이미지 경계의 여백
                                                decoration: BoxDecoration(
                                                  color: dog.shelterDogInfo
                                                              .sex ==
                                                          'FEMALE'
                                                      ? customGreen
                                                      : customOrange, // 아이콘 배경색
                                                  shape: BoxShape
                                                      .circle, // 원형으로 만들기
                                                ),
                                                child: Icon(
                                                  dog.shelterDogInfo.sex ==
                                                          'FEMALE'
                                                      ? MyFlutterApp.vector
                                                      : MyFlutterApp.vector__1_,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          MakeTextList(
                                            title:
                                                ' ${dog.etcInfo.location}에서 발견',
                                            textIcon: Icons.info_outline,
                                          ),
                                          MakeTextList(
                                            title:
                                                ' ${dog.etcInfo.dateTime.toString().substring(0, 10)}구조',
                                            textIcon:
                                                Icons.calendar_month_outlined,
                                          ),
                                          MakeTextList(
                                            title: ' ${dog.shelterInfo.name}',
                                            textIcon:
                                                Icons.location_on_outlined,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            MakeTextButton(
                                text: "다른 공고 찾아보기",
                                color: customGreen,
                                buttonWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                buttonHeight: 50,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                radius: 12,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
