import 'package:flutter/material.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_detail_model.dart';
import 'package:frontend/my_flutter_app_icons.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/services/ai_search_api_service.dart';

class AiResultDetailScreen extends StatelessWidget {
  const AiResultDetailScreen({super.key, required this.id});

  final String id;
  final Color lineColor = const Color.fromRGBO(210, 210, 210, 1);

  @override
  Widget build(BuildContext context) {
    // final Future<ShelterDogDetailModel> details =
    //     AiSearchApiService.getDetailDogInfo(id);
    return Scaffold(
      // body: FutureBuilder<ShelterDogDetailModel>(
      //   future: details,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData) {
      //       return const Center(child: Text('No data available'));
      //     } else {
      //       // 데이터가 있을 때 화면에 표시
      //       var dogInfo = snapshot.data!;
      //       return SingleChildScrollView(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Image.network(dogInfo.shelterDogInfo.image),
      //             const SizedBox(height: 20.0),
      //             Text('Breed: ${dogInfo.shelterDogInfo.breed}'),
      //             Text('Sex: ${dogInfo.shelterDogInfo.sex}'),
      //             Text('Color: ${dogInfo.shelterDogInfo.color}'),
      //             Text(
      //                 'Is Neutering: ${dogInfo.shelterDogInfo.isNeutering ? 'Yes' : 'No'}'),
      //             Text('Feature: ${dogInfo.shelterDogInfo.feature}'),
      //             const SizedBox(height: 20.0),
      //             Text('Location: ${dogInfo.etcInfo.location}'),
      //             Text('Date Time: ${dogInfo.etcInfo.dateTime.toString()}'),
      //           ],
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/samplePuppy2.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      MyFlutterApp.logo,
                      size: 19,
                      color: customGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "동물정보",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Table(
                  border: TableBorder(
                      top: BorderSide(width: 1.0, color: lineColor),
                      bottom: BorderSide(width: 1.0, color: lineColor),
                      verticalInside: BorderSide.none, // 양옆 경계선 제거
                      horizontalInside:
                          BorderSide(width: 1.0, color: lineColor)),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(100.0),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    makeTableRow("공고번호", "대전-서구-2024-00378"),
                    makeTableRow("품종", "시추"),
                    makeTableRow("털색", "흰색, 갈색"),
                    makeTableRow("성별", "암컷"),
                    makeTableRow("중성화 여부", "아니요"),
                    makeTableRow("특징", "24-0595 석탄")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Icon(
                      MyFlutterApp.logo,
                      size: 19,
                      color: customGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "구조정보",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Table(
                  border: TableBorder(
                      top: BorderSide(width: 1.0, color: lineColor),
                      bottom: BorderSide(width: 1.0, color: lineColor),
                      verticalInside: BorderSide.none, // 양옆 경계선 제거
                      horizontalInside:
                          BorderSide(width: 1.0, color: lineColor)),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(100.0),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    makeTableRow("구조일", "대전-서구-2024-00378"),
                    makeTableRow("구조장소", "시추"),
                    makeTableRow("공고기간", "흰색, 갈색"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Icon(
                      MyFlutterApp.logo,
                      size: 19,
                      color: customGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "동물보호센터 안내",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Table(
                  border: TableBorder(
                      top: BorderSide(width: 1.0, color: lineColor),
                      bottom: BorderSide(width: 1.0, color: lineColor),
                      verticalInside: BorderSide.none, // 양옆 경계선 제거
                      horizontalInside:
                          BorderSide(width: 1.0, color: lineColor)),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(100.0),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    makeTableRow("보호센터", "대전광역시 동물보호센터"),
                    makeTableRow("대표자", "정현조"),
                    makeTableRow("주소", "대전광역시 유성구 금남구즉로1234"),
                    makeTableRow("전화번호", "041-825-1118"),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  TableRow makeTableRow(String label, String content) {
    return TableRow(
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content),
        ),
      ],
    );
  }
}
