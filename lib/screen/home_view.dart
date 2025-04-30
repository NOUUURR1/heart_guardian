import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/heart_view.dart';
import 'package:heart_guardian/screen/profile_screen.dart';
import 'package:heart_guardian/widgets/custom_app_bar.dart';
import 'package:heart_guardian/widgets/custom_navigation_bar.dart';
import 'package:heart_guardian/widgets/home_screen_content.dart';
import 'login_view.dart';
import 'signup_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _pageIndex = 0;

  final List<Widget> _widgetOptions = [
    HomeScreenContent(),
    HeartView(),
    const SizedBox(),
  ];

  void _onNavigationItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ).then((value) {
        if (value == 0) {
          setState(() {
            _pageIndex = 0;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Center(child: _widgetOptions.elementAt(_pageIndex)),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onNavigationItemTapped,
      ),
      extendBody: true,
    );
  }
}
