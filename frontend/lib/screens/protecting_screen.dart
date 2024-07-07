import 'package:flutter/material.dart';
import 'package:frontend/models/ai_result/ai_result_dog.dart';
import 'package:frontend/models/my_missing_dog/missing_dog.dart';
import 'package:frontend/screens/ai_search_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:frontend/screens/my_screen.dart';
import 'package:frontend/screens/protect_add_screen.dart';
import 'package:frontend/screens/shelter_search_screen.dart';
import 'package:frontend/widgets/bottom_bar.dart';
import 'package:frontend/widgets/make_text_list.dart';

List<AiResultDog> resultDogs = [
  AiResultDog(
    id: 1,
    image: 'assets/images/samplePuppy.jpeg',
    sex: 'Male',
    dateTime: '2023-07-04T12:00:00',
    location: '서구 갈마동',
    whoProtected: '개인 임시보호중',
    percentage: 99,
    aiType: '비문',
  ),
  AiResultDog(
    id: 2,
    image: 'assets/images/samplePuppy2.jpeg',
    sex: 'Male',
    dateTime: '2023-07-04T12:00:00',
    location: '동구 유천동',
    whoProtected: '대전광역시 동물보호센터',
    percentage: 95,
    aiType: '비문',
  ),
  AiResultDog(
    id: 3,
    image: 'assets/images/samplePuppy3.jpeg',
    sex: 'Male',
    dateTime: '2023-07-04T12:00:00',
    location: '동구 은행동',
    whoProtected: '개인 임시보호중',
    percentage: 80,
    aiType: '비문',
  ),
  AiResultDog(
    id: 4,
    image: 'assets/images/samplePuppy3.jpeg',
    sex: 'Male',
    dateTime: '2023-07-04T12:00:00',
    location: '동구 은행동',
    whoProtected: '개인 임시보호중',
    percentage: 80,
    aiType: '비문',
  ),
  AiResultDog(
    id: 5,
    image: 'assets/images/samplePuppy3.jpeg',
    sex: 'Male',
    dateTime: '2023-07-04T12:00:00',
    location: '동구 은행동',
    whoProtected: '개인 임시보호중',
    percentage: 80,
    aiType: '비문',
  ),
];

class ProtectingScreen extends StatefulWidget {
  const ProtectingScreen({super.key});
  static const hsbaColor = Color.fromRGBO(59, 59, 59, 0.23);
  static const customGrey = Color.fromRGBO(240, 240, 240, 1);

  @override
  State<ProtectingScreen> createState() => _ProtectingScreenState();
}

class _ProtectingScreenState extends State<ProtectingScreen> {
  int _selectedIndex = 0;

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
              "보호중입니다.",
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
                        color: ProtectingScreen.hsbaColor,
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
                Icon(Icons.circle),
                Text(
                  "최근에 보호소 및 게시판에 등록된 공고에요.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 0,
              ),
              child: SizedBox(
                height: resultDogs.length * 140,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          AspectRatio(
                            aspectRatio: 1.7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                dog.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MakeTextList(
                            title: ' ${dog.location}',
                            textIcon: Icons.info_outline,
                          ),
                          MakeTextList(
                            title: ' ${dog.dateTime}구조',
                            textIcon: Icons.calendar_month_outlined,
                          ),
                          MakeTextList(
                            title: ' ${dog.whoProtected}',
                            textIcon: Icons.location_on_outlined,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 버튼 클릭시 수행할 액션 작성
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProtectAddScreen()));
        },
        backgroundColor: customGreen,
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
