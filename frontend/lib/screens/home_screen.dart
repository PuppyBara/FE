import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_screen/ai_search_screen.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:frontend/screens/shelter_screen/shelter_search_screen.dart';
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
