import 'package:flutter/material.dart';
import 'package:frontend/my_flutter_app_icons.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          makeBottomItem(MyFlutterApp.home_05),
          makeBottomItem(Icons.search),
          makeBottomItem(
            MyFlutterApp.logo__1_,
          ),
          makeBottomItem(
            MyFlutterApp.user,
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        onTap: widget.onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  BottomNavigationBarItem makeBottomItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }
}
