import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fullNameController = TextEditingController(
    text: 'Alaa Elashmawi',
  );
  bool isFullNameUpdated = false;
  bool _obscurePassword = true;
  TextEditingController birthdateController = TextEditingController(
    text: '19/07/2003',
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2003, 7, 19),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _updateFullName() {
    // هنا هتحط منطق حفظ الاسم الجديد (في الذاكرة المؤقتة، قاعدة البيانات، إلخ.)
    if (fullNameController.text != 'Alaa Elashmawi') {
      // ... حفظ الاسم الجديد ...
      setState(() {
        isFullNameUpdated = true;
      });
    } else {
      setState(() {
        isFullNameUpdated = false;
      });
    }
  }

  void _updateProfile() async {
    String fullName = fullNameController.text;
    String _ = birthdateController.text;
    if (fullName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الاسم الكامل لا يمكن أن يكون فارغًا')),
      );
      return;
    }
    setState(() {
      // عرض مؤشر التحميل 
    });

    await Future.delayed(const Duration(seconds: 2));
    bool isSaveSuccessful = true; 

    setState(() {
      // إخفاء مؤشر التحميل (لو هتستخدمه)
    });

    if (isSaveSuccessful) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تحديث البروفايل بنجاح!')),
      );
      // ممكن تعمل navigate لشاشة تانية أو أي إجراء تاني
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء تحديث البروفايل. حاول مرة أخرى.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 68, top: 15),
          child: Text(
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
              controller: fullNameController,
              onSubmitted: (_) => _updateFullName(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Alaa Elashmawi',
                suffixIcon: Icon(
                  Icons.check,
                  color: isFullNameUpdated ? Color(0XFF042D46) : Colors.grey,
                ),
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
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '**********',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
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
              controller: birthdateController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '19/07/2003',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () => _selectDate(context),
                ),
                filled: true,
                fillColor: const Color(0xFFE0F2F7),
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateProfile, 
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
