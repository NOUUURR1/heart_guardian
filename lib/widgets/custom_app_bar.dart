import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/notification_screen.dart';
import 'package:heart_guardian/screen/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int userId;

  const CustomAppBar({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 250, top: 16),
          child: const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/Images/Profil.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications_on_outlined, size: 30),
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
                icon: const Icon(Icons.settings, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
