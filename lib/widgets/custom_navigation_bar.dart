import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      height: 75.0,
      items: const <Widget>[
        Icon(Icons.home_outlined, size: 35, color: Colors.white),
        Icon(Icons.monitor_heart, size: 35, color: Colors.white),
        Icon(Icons.person, size: 35, color: Colors.white),
      ],
      color: const Color(0xFF6C9FBB),
      buttonBackgroundColor: const Color(0xFF042D46),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: onTap,
      letIndexChange: (index) => true,
    );
  }
}
