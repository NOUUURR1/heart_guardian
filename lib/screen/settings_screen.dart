import 'package:flutter/material.dart';
import 'package:heart_guardian/core/theme_notifier.dart';
import 'package:heart_guardian/screen/notification_screen.dart';
import 'package:heart_guardian/screen/profile_screen.dart';
import 'package:heart_guardian/screen/splash_screen.dart';
import 'package:heart_guardian/settings/dark_mode_switch_item.dart';
import 'package:heart_guardian/settings/help_support.dart';
import 'package:heart_guardian/settings/language_selector.dart';
import 'package:heart_guardian/settings/privacy_screen.dart';
import 'package:heart_guardian/widgets/settings_card.dart';
import 'package:heart_guardian/widgets/settings_item.dart';
import 'package:heart_guardian/widgets/settings_section_title.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsScreen extends StatelessWidget {
  final int userId;
  const SettingsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA0D1EF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 100,
        title: Text(
          'settings'.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'Agbalumo',
          fontSize: 16,
          color: Colors.black,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsSectionTitle(title: 'account'.tr()),
                SettingsCard(
                  children: [
                    SettingsItem(
                      icon: Icons.person_outline,
                      title: 'account'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(userId: userId),
                          ),
                        );
                      },
                    ),
                    const LanguageSelector(),
                    SettingsItem(
                      icon: Icons.notifications_active_outlined,
                      title: 'notifications'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                    ),

                    const DarkModeSwitchItem(),
                  ],
                ),
                const SizedBox(height: 10.0),
                SettingsSectionTitle(title: 'support_about'.tr()),
                SettingsCard(
                  children: [
                    SettingsItem(
                      icon: Icons.lock_outline,
                      title: 'privacy'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyScreen(),
                          ),
                        );
                      },
                    ),
                    SettingsItem(
                      icon: Icons.question_mark_rounded,
                      title: 'help_support'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpSupportScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SettingsSectionTitle(title: 'actions'.tr()),
                SettingsCard(
                  children: [
                    SettingsItem(
                      icon: Icons.logout_outlined,
                      title: 'logout'.tr(),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
