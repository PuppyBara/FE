import 'package:flutter/material.dart';
import 'package:frontend/models/ai_result/ai_result_dog.dart';
import 'package:frontend/models/missingdog_id/missing_dog_model.dart';
import 'package:frontend/my_flutter_app_icons.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:frontend/screens/missing_screen/missing_add_screen.dart';
import 'package:frontend/screens/my_screen.dart';
import 'package:frontend/screens/protect_screen/protect_add_screen.dart';
import 'package:frontend/screens/shelter_screen/shelter_search_screen.dart';
import 'package:frontend/services/missing_dog_service.dart';
import 'package:frontend/widgets/bottom_bar.dart';
import 'package:frontend/widgets/make_text_list.dart';

class MissingNoticeScreen extends StatefulWidget {
  const MissingNoticeScreen({super.key});
  static const hsbaColor = Color.fromRGBO(59, 59, 59, 0.23);
  static const customGrey = Color.fromRGBO(240, 240, 240, 1);

  @override
  State<MissingNoticeScreen> createState() => _MissingNoticeScreenState();
}

class _MissingNoticeScreenState extends State<MissingNoticeScreen> {
  int _selectedIndex = 0;
  late Future<MissingDogModel> missingDogs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    missingDogs = MissingDogService().getMissingDogs();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => _widgetOptions[_selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "실종공고",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: const Divider(
                height: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "지역/품종을 입력하세요.",
                      style: TextStyle(
                        fontSize: 16,
                        color: MissingNoticeScreen.hsbaColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_sharp),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MyFlutterApp.logo,
                  size: 19,
                  color: customOrange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "최근에 등록된 공고에요.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: missingDogs,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var resultDogs = snapshot.data!.missingDogs;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                      child: SizedBox(
                        height: resultDogs.length * 140,
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
                                    color: Color.fromRGBO(0, 0, 0, 0.08),
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
                                          color: dog.sex == 'FEMALE'
                                              ? customGreen
                                              : customOrange, // 아이콘 배경색
                                          shape: BoxShape.circle, // 원형으로 만들기
                                        ),
                                        child: Icon(
                                          dog.sex == 'FEMALE'
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
                                    title: ' ${dog.location}',
                                    textIcon: Icons.info_outline,
                                  ),
                                  MakeTextList(
                                    title:
                                        ' ${dog.dateTime.substring(0, 10)}부근',
                                    textIcon: Icons.calendar_month_outlined,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("강아지 실종 공고 렌더링 실패");
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 버튼 클릭시 수행할 액션 작성

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MissingAddScreen()));
        },
        backgroundColor: customOrange,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.0))),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: BottomBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: onItemTapped,
      // ),
    );
  }
}
