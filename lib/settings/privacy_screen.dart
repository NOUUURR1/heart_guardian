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
              fontSize: 18,
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
                  'Your personal data is safe with us.\n'
                  'We only collect what’s needed to improve your experience.\n'
                  'We never share it with others.',
                  textAlign: TextAlign.start,

                  style: TextStyle(
                    fontSize: 17,
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
                  'You can request access to your data.\n'
                  'You can delete your account and related data.\n'
                  'You can turn off notifications or tracking features.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
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
