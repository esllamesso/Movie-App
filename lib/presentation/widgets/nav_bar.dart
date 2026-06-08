import 'package:flutter/material.dart';

import '../screens/coming_soon_screen.dart';
import '../screens/download_screen.dart';
import '../screens/home_screen.dart';
import '../screens/more_screen.dart';
import '../screens/search_screen.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ComingSoonScreen(),
    DownloadScreen(),
    MoreScreen(),
  ];

  void onItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        height: 60,
        color: const Color.fromRGBO(18, 18, 18, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navItem(Icons.home_outlined, "Home", 0),
            navItem(Icons.search, "Search", 1),
            navItem(Icons.perm_media_outlined, "Coming Soon", 2),
            navItem(Icons.download_rounded, "Downloads", 3),
            navItem(Icons.more_horiz, "More", 4),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String text, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItem(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 25,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 8.2,
            ),
          ),
        ],
      ),
    );
  }
}