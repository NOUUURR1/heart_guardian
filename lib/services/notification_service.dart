import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        navigatorKey.currentState?.pushNamed('/notificationScreen');
      },
    );
  }

  static Future<void> showHeartRateAlert(int bpm) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'heart_alerts', // ID للقناة
          'Heart Rate Alerts', // اسم القناة
          channelDescription: 'Alerts when heart rate is out of safe range',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    final String title = 'Heart Rate Alert'; // 👈 توحيد العنوان

    await _plugin.show(
      0,
      title,
      'Heart rate is abnormal: $bpm bpm',
      platformDetails,
    );

    // حفظ الإشعار في SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final notificationsString = prefs.getString('notifications') ?? '[]';
    final notifications = json.decode(notificationsString) as List;

    final newNotification = {
      'title': title,
      'subtitle': 'Heart rate is abnormal: $bpm bpm',
      'time': DateTime.now().toIso8601String(),
    };

    notifications.insert(0, newNotification);
    await prefs.setString('notifications', json.encode(notifications));

    await prefs.setBool('hasNotifications', true);
  }
}
