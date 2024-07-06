import 'package:flutter/material.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/screens/shelter_search_result_screen.dart';
import 'package:frontend/widgets/make_text_button.dart';

class ShelterSearchScreen extends StatelessWidget {
  const ShelterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "보호소 선택",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: const SheleterListWidget(),
      ),
    );
  }
}

class SheleterListWidget extends StatefulWidget {
  const SheleterListWidget({super.key});

  @override
  State<SheleterListWidget> createState() => _SheleterListWidgetState();
}

class _SheleterListWidgetState extends State<SheleterListWidget> {
  final List<String> regions = ['서울', '경기', '충남'];
  final Map<String, List<String>> shelters = {
    '서울': ['보호소1', '보호소2'],
    '경기': ['보호소3', '보호소4'],
    '충남': ['보호소5', '보호소6'],
  };

  late String selectedRegion;
  late String selectedShelter;

  @override
  void initState() {
    super.initState();
    selectedRegion = regions[0];
    selectedShelter = shelters[selectedRegion]![0]; // 각 지역의 첫 번째 보호소를 기본으로 선택
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            children: [
              Text(
                '보호소 또는 지역을 선택하여',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                "보호중인 동물 정보를 확인해보세요.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  width: 1.5,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width:
                      MediaQuery.of(context).size.width * 0.4, // 지역 리스트의 너비를 설정
                  child: ListView.builder(
                    itemCount: regions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          regions[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: selectedRegion == regions[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        tileColor: selectedRegion == regions[index]
                            ? customGreen
                            : Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedRegion = regions[index];
                            selectedShelter = shelters[selectedRegion]![
                                0]; // 선택된 지역의 첫 번째 보호소 선택
                          });
                        },
                      );
                    },
                  ),
                ),
                const VerticalDivider(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  width: 1.5,
                ), // 구분선
                Expanded(
                  child: ListView.builder(
                    itemCount: shelters[selectedRegion]!.length,
                    itemBuilder: (context, index) {
                      final shelter = shelters[selectedRegion]![index];
                      return ListTile(
                        title: Text(
                          shelter,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: selectedShelter == shelter
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        tileColor:
                            selectedShelter == shelter ? customGreen : null,
                        onTap: () {
                          setState(() {
                            selectedShelter = shelter;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        MakeTextButton(
          text: "선택완료",
          color: customOrange,
          buttonWidth: 378,
          buttonHeight: 52,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShelterSearchResultScreen(
                  selectedShelter: selectedShelter,
                ),
              ),
            );
          },
          radius: 12,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
