import 'package:flutter/material.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Today',
            style: TextStyle(
              color: Color(0xFFA0D1EF),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Agbalumo',
            ),
          ),
          Text(
            'Mark all as read',
            style: TextStyle(
              color: Color(0xFFA0D1EF),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Agbalumo',
            ),
          ),
        ],
      ),
    );
  }
}
