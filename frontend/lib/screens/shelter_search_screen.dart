import 'package:flutter/material.dart';

class ShelterSearchScreen extends StatelessWidget {
  const ShelterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SheleterListWidget(),
    );
  }
}

class SheleterListWidget extends StatefulWidget {
  const SheleterListWidget({
    super.key,
  });

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

  @override
  void initState() {
    super.initState();
    selectedRegion = regions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 200, // 지역 리스트의 너비를 설정
          child: ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(regions[index]),
                onTap: () {
                  setState(() {
                    selectedRegion = regions[index];
                  });
                },
              );
            },
          ),
        ),
        const VerticalDivider(width: 1), // 구분선
        Expanded(
          child: ListView.builder(
            itemCount: shelters[selectedRegion]!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(shelters[selectedRegion]![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
