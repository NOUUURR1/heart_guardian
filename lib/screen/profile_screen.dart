import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 68, top: 15),
          child: const Text(
            'My Profile',
            style: TextStyle(
              color: Color(0XFF042D46),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0XFF042D46)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context, 0);
          },
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Color(0xFF042D46),
                            width: 4.0,
                          ),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/Images/Profil.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFB3D9EF),
                      radius: 20,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Alaa Elashmawi',
                suffixIcon: const Icon(Icons.check, color: Color(0XFF042D46)),
                filled: true,
                fillColor: const Color(0xFFE0F2F7),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'alaa@gmail.com',
                filled: true,
                fillColor: const Color(0xFFE0F2F7),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '**********',
                suffixIcon: const Icon(Icons.visibility_off),
                filled: true,
                fillColor: const Color(0xFFE0F2F7),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Birthdate',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '19/07/2003',
                suffixIcon: const Icon(Icons.arrow_drop_down),
                filled: true,
                fillColor: const Color(0xFFE0F2F7),
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF042D46),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
