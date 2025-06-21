import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/notification_screen.dart';
import 'package:heart_guardian/screen/settings_screen.dart';
import 'package:heart_guardian/screen/profile_screen.dart';
import 'package:heart_guardian/widgets/location_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int userId;

  const CustomAppBar({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(userId: userId),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/Images/Profil.png"),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Color(0XFF000000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_on_outlined,
                    size: 30,
                    color: Color(0XFF000000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(userId: userId),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Color(0XFF000000),
                  ),
                ),
                // ضيفي أي أيقونات تانية هنا براحتك
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
