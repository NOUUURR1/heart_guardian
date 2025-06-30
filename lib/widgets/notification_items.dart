import 'package:flutter/material.dart';
import 'package:heart_guardian/main.dart';
import 'package:heart_guardian/screen/heart_view.dart';
import 'package:heart_guardian/screen/open_camera_screen.dart';
import 'package:heart_guardian/widgets/location_screen.dart';

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const NotificationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Heart Rate Alert' || title.contains('Heart Rate')) {
          navigatorKey.currentState?.pushNamed(
            '/heartView',
            arguments: {'showAppBar': true},
          );
        } else if (title == 'Open Camera' || title.contains('Camera')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => const OpenCameraScreen(
                    cameraIp: '192.168.1.11',
                    userId: 0,
                  ),
              settings: const RouteSettings(
                arguments: {'fromNotification': true},
              ),
            ),
          );
        } else if (title == 'Location Alert' || title.contains('Location')) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LocationScreen()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: const Color(0XFFE8E8E8),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0XFF042D46).withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA0D1EF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(icon, color: const Color(0XFF042D46), size: 28.0),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Agbalumo',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0XFF042D46),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0XFF918C8C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agbalumo',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
