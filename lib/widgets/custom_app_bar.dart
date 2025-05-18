import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Center(child: Row(mainAxisSize: MainAxisSize.min)),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 250, top: 16),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: const AssetImage("assets/Images/Profil.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_on_outlined, size: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
