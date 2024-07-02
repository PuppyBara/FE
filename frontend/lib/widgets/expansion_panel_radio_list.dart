import 'package:flutter/material.dart';
// panel_data.dart 파일의 위치에 따라 수정

class PanelData {
  final Color iconColor;
  final String title;
  final String photoUrl;
  final String name;
  final String date;
  final String location;

  PanelData({
    required this.iconColor,
    required this.title,
    required this.photoUrl,
    required this.name,
    required this.date,
    required this.location,
  });
}

class ExpansionPanelRadioList extends StatefulWidget {
  final List<PanelData> panels; // 부모 위젯으로부터 받는 패널 데이터 목록

  const ExpansionPanelRadioList({super.key, required this.panels});

  @override
  _ExpansionPanelRadioListState createState() =>
      _ExpansionPanelRadioListState();
}

class _ExpansionPanelRadioListState extends State<ExpansionPanelRadioList> {
  int _currentIndex = 0; // 기본 선택된 패널 인덱스

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: widget.panels.map((panelData) {
        return ExpansionPanel(
          isExpanded: _currentIndex == widget.panels.indexOf(panelData),
          headerBuilder: (context, isExpanded) => ListTile(
            leading: CircleAvatar(
              backgroundColor: panelData.iconColor,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(panelData.title),
          ),
          body: ListTile(
            leading: Image.network(panelData.photoUrl),
            title: Text(panelData.name),
            subtitle: Text('${panelData.date} - ${panelData.location}'),
          ),
        );
      }).toList(),
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _currentIndex = isExpanded ? -1 : panelIndex;
        });
      },
    );
  }
}
