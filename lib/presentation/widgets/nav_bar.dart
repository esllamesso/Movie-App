import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  void onItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Color.fromRGBO(18, 18, 18, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(Icons.home_outlined, "Home", 0),
          NavItem(Icons.search, "Search", 1),
          NavItem(Icons.perm_media_outlined, "Coming Soon", 2),
          NavItem(Icons.download_rounded, "Downloads", 3),
          NavItem(Icons.more_horiz, "More", 4),
        ],
      ),
    );
  }

  Widget NavItem(IconData icon, String text, int index) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? Colors.white : Colors.grey;

    return GestureDetector(
      onTap: () => onItem(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 25, color: color),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 8.2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
