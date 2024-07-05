import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/screens/ai_result_detail_screen.dart';
import 'package:frontend/widgets/aiSearchProgress.dart';
import 'package:frontend/models/ai_result/aI_result_dog.dart';
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

class AiSearchResultScreen extends StatelessWidget {
  const AiSearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AiSearchProgress(
              progressText: '총 ${resultDogs.length}건이 검색되었습니다.',
              selectNum: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2.5,
              color: const Color.fromRGBO(236, 236, 236, 1),
              indent: MediaQuery.of(context).size.width * 0.1,
              endIndent: MediaQuery.of(context).size.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 0,
              ),
              child: SizedBox(
                height: resultDogs.length * 80,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: resultDogs.length,
                  itemBuilder: (context, index) {
                    final dog = resultDogs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AiResultDetailScreen(
                                    id: dog.id.toString())));
                      },
                      child: Container(
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
                              title: ' ${dog.location}에서 발견',
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
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
