import 'package:flutter/material.dart';
import 'package:frontend/widgets/make_text_list.dart';
import 'package:frontend/services/shelter_service.dart';

class ShelterSearchResultScreen extends StatelessWidget {
  ShelterSearchResultScreen({super.key, required this.selectedShelter});

  late List<String> selectedShelter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
      body: ShelterAnnounceWidget(selectedShelter: selectedShelter),
    ));
  }
}

// 전체 선택, 단일 선택에 따라 UI 달라짐
class ShelterAnnounceWidget extends StatelessWidget {
  const ShelterAnnounceWidget({
    super.key,
    required this.selectedShelter,
  });
  final List<String> selectedShelter;

  @override
  Widget build(BuildContext context) {
    final shelterService = ShelterService().postShelterDogs(selectedShelter);
    return FutureBuilder(
        future: shelterService,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var resultDogs = snapshot.data!;
            return Column(
              children: [
                const Divider(
                  height: 1,
                ),
                Image.asset('assets/images/samplePuppy.jpeg'),
                const Row(
                  children: [
                    Icon(Icons.circle),
                    Text("대전광역시 동물보호센터에 등록된 공고예요"),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text("대전광역시 유성구 금남구즉로 1234"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.call),
                          Text("010-3112-2312"),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),
                        child: SizedBox(
                          height: resultDogs.length * 80,
                          child: GridView.builder(
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
                                    AspectRatio(
                                      aspectRatio: 1.7,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          resultDogs.shelterDogInfo.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MakeTextList(
                                      title: ' ${resultDogs.noticeSdt}에서 발견',
                                      textIcon: Icons.info_outline,
                                    ),
                                    MakeTextList(
                                      title: ' ${resultDogs.noticeSdt}구조',
                                      textIcon: Icons.calendar_month_outlined,
                                    ),
                                    MakeTextList(
                                      title: ' ${resultDogs.whoProtected}',
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
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
