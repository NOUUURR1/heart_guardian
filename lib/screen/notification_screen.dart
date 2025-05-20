import 'package:flutter/material.dart';
import 'package:heart_guardian/widgets/notification_appbar.dart';
import 'package:heart_guardian/widgets/notification_header.dart';
import 'package:heart_guardian/widgets/notification_items.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NotificationAppBar(),
      body: Column(
        children: const [
          NotificationHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NotificationItem(
                    icon: Icons.person_outline,
                    title: 'Check on Child',
                    subtitle: 'Attention, mom, time to check on your child.',
                    time: '1h',
                  ),
                  NotificationItem(
                    icon: Icons.camera_alt_outlined,
                    title: 'Open Camera',
                    subtitle:
                        'Open the camera to see what your child is doing right now.',
                    time: '2h',
                  ),
                  NotificationItem(
                    icon: Icons.chat_bubble_outline,
                    title: 'Ask About Day',
                    subtitle:
                        'Ask your child how they\'re feeling and how their day went.',
                    time: '3h',
                  ),
                  NotificationItem(
                    icon: Icons.favorite_border,
                    title: 'Health Check',
                    subtitle:
                        'Check if your child is healthy or feeling unwell.',
                    time: '4h',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
