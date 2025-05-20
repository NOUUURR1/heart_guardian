import 'package:flutter/material.dart';

class SettingsSectionTitle extends StatelessWidget {
  final String title;

  const SettingsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Agbalumo',
        color: const Color(0xFFA0D1EF),
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
