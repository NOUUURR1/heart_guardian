import 'package:firebase_database/firebase_database.dart';
import 'notification_service.dart';

class HeartMonitorService {
  static void startMonitoring() {
    final databaseRef = FirebaseDatabase.instance.ref('SensorData/BPM');

    databaseRef.onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        final bpm = int.tryParse(value.toString());
        if (bpm != null && (bpm < 70 || bpm > 110)) {
          print(' معدل ضربات القلب خارج النطاق: $bpm');
          NotificationService.showHeartRateAlert(bpm);
        }
      }
    });
  }
}
