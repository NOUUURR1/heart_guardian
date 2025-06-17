import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'projectteam1235@gmail.com',
      query: 'subject=Support Needed&body=Hello, I need help with...',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      debugPrint('Could not launch email client.');
    }
  }

  void _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse("https://wa.me/201091256413");
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch WhatsApp.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA0D1EF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Need Assistance?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Agbalumo',
                color: Color(0XFF042D46),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 7,
              color: Colors.white,
              shadowColor: const Color(0xFF6C9FBB),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'If you have any questions or need help using the app, feel free to contact us through the following methods:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.email_outlined,
                        color: Color(0XFF042D46),
                      ),
                      title: const Text(
                        'projectteam1235@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF656363),
                          fontFamily: 'Agbalumo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: _launchEmail,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        'assets/icons/whatsapp.svg',
                        width: 24,
                        height: 24,
                      ),
                      title: const Text(
                        '+20 1091256413',
                        style: TextStyle(
                          color: Color(0xFF656363),
                          fontSize: 16,
                          fontFamily: 'Agbalumo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: _launchWhatsApp,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'You can access the FAQ section or contact us directly. Our team will get back to you as soon as possible.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Agbalumo',
                color: Color(0XFF042D46),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
