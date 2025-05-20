import 'package:flutter/material.dart';
import 'package:heart_guardian/core/theme_notifier.dart';
import 'package:heart_guardian/widgets/settings_card.dart';
import 'package:heart_guardian/widgets/settings_item.dart';
import 'package:heart_guardian/widgets/settings_section_title.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: const Text(
          'Settings',
          style: TextStyle(
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
                const SettingsSectionTitle(title: 'Account'),
                const SettingsCard(
                  children: [
                    SettingsItem(icon: Icons.person_outline, title: 'Account'),
                    SettingsItem(
                      icon: Icons.language_outlined,
                      title: 'Language',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('English'),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                    SettingsItem(
                      icon: Icons.notifications_active_outlined,
                      title: 'Notifications',
                    ),
                  ],
                ),
                // الكارد الخاص بالدارك مود منفصل عشان نقدر نربط الـ Switch بالـ Provider
                const SizedBox(height: 12),
                Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, child) {
                    return SettingsCard(
                      children: [
                        SettingsItem(
                          icon: Icons.brightness_4_outlined,
                          title: 'Dark Mode',
                          trailing: Switch(
                            value: themeNotifier.isDarkMode,
                            onChanged: (value) {
                              themeNotifier.toggleTheme();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24.0),
                const SettingsSectionTitle(title: 'Support & About'),
                const SettingsCard(
                  children: [
                    SettingsItem(icon: Icons.lock_outline, title: 'Privacy'),
                    SettingsItem(
                      icon: Icons.question_mark_rounded,
                      title: 'Help & Support',
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                const SettingsSectionTitle(title: 'Actions'),
                const SettingsCard(
                  children: [
                    SettingsItem(
                      icon: Icons.group_add_outlined,
                      title: 'Add account',
                    ),
                    SettingsItem(icon: Icons.logout_outlined, title: 'Log out'),
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
