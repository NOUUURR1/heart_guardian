import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/heart_view.dart';
import 'package:heart_guardian/screen/profile_screen.dart';
import 'package:heart_guardian/screen/open_camera_screen.dart';
import 'package:heart_guardian/widgets/custom_app_bar.dart';
import 'package:heart_guardian/widgets/custom_navigation_bar.dart';
import 'package:heart_guardian/widgets/home_screen_content.dart';

class HomeView extends StatefulWidget {
  final int userId;

  const HomeView({super.key, required this.userId});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _pageIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeScreenContent(),
      HeartView(),
      const SizedBox(), 
      const SizedBox(), 
    ];
  }

  void _onNavigationItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => OpenCameraScreen(
                cameraIp: '192.168.1.11',
                userId: widget.userId, 
              ),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(userId: widget.userId),
        ),
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
      appBar: CustomAppBar(userId: widget.userId),
      body: Center(child: _widgetOptions.elementAt(_pageIndex)),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onNavigationItemTapped,
      ),
      extendBody: true,
    );
  }
}
