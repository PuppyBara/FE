import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_search_screen.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:frontend/screens/shelter_search_screen.dart';
import 'package:frontend/widgets/bottom_bar.dart';
import 'package:frontend/screens/my_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    ShelterSearchScreen(),
    AiSearchScreen(),
    MyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<PanelData> panelDataList = [
      PanelData(
        iconColor: Colors.blue,
        title: 'Panel 1',
        photoUrl: 'https://via.placeholder.com/150',
        name: 'John Doe',
        date: '2024-07-04',
        location: 'New York',
      ),
      PanelData(
        iconColor: Colors.green,
        title: 'Panel 2',
        photoUrl: 'https://via.placeholder.com/150',
        name: 'Jane Smith',
        date: '2024-07-05',
        location: 'Los Angeles',
      ),
    ];

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

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
