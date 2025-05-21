import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA0D1EF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your Privacy Matters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Agbalumo',
                color: Color(0xFF042D46),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              elevation: 10,
              shadowColor: const Color(0xFF6C9FBB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'We value your privacy and ensure your personal data is protected. '
                  'This application collects only necessary information to provide the best experience. '
                  'All sensitive data, such as your location or heart rate, is securely stored and not shared with third parties.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0F657C),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Your rights:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Agbalumo',
                color: Color(0xFF042D46),
              ),
            ),
            const SizedBox(height: 8),

            // Card لحقوق المستخدم
            Card(
              color: Colors.white,
              elevation: 10,
              shadowColor: const Color(0xFF6C9FBB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '* You can request access to your data.\n'
                  '* You can request deletion of your account and all related data.\n'
                  '* You can optout of notifications or tracking features.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0F657C),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: const Text(
                'For more information, contact us through the Help & Support section.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF042D46),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Agbalumo',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
