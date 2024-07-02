import 'package:flutter/material.dart';

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
          makeBottomItem(Icons.home),
          makeBottomItem(Icons.search),
          makeBottomItem(
            Icons.circle,
          ),
          makeBottomItem(
            Icons.person_2_outlined,
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
