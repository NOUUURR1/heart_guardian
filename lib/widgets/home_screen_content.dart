import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseReference bpmRef = FirebaseDatabase.instance.ref("sensorData/BPM");
    DatabaseReference spo2Ref = FirebaseDatabase.instance.ref(
      "sensorData/SpO2",
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 12.0),
        const Text(
          'Guardians  Hearts',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.black,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Color(0xFF6BAED6),
                offset: Offset(2, 3),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<DatabaseEvent>(
                    stream: spo2Ref.onValue,
                    builder: (context, snapshot) {
                      final value = snapshot.data?.snapshot.value;
                      return _buildDataItem(
                        title: 'Oxygen\nPercentage',
                        valueWidget:
                            value != null
                                ? Text(
                                  '$value %',
                                  style: const TextStyle(
                                    color: Color(0xFF042D46),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                                : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: StreamBuilder<DatabaseEvent>(
                    stream: bpmRef.onValue,
                    builder: (context, snapshot) {
                      final value = snapshot.data?.snapshot.value;
                      return _buildDataItem(
                        title: 'Heartbeats',
                        valueWidget:
                            value != null
                                ? Text(
                                  '$value bpm',
                                  style: const TextStyle(
                                    color: Color(0xFF042D46),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                                : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Blogs :',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF042D46),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataItem({required String title, required Widget valueWidget}) {
    return Card(
      color: const Color(0xFF6BAED6).withOpacity(0.5),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8.0),
            valueWidget,
          ],
        ),
      ),
    );
  }
}
