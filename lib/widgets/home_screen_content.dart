import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: _buildDataItem(
                    title: 'Oxygen\nPercentage',
                    value: '95 - 100 %',
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildDataItem(title: 'Heartbeats', value: '60-100'),
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
        // باقي محتوى الـ body هيكون هنا
      ],
    );
  }

  Widget _buildDataItem({required String title, required String value}) {
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
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF042D46),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
