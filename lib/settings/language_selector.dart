import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heart_guardian/widgets/settings_item.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // نجيب اللغة الحالية
    final currentLocale = context.locale;

    return SettingsItem(
      icon: Icons.language,
      title: 'language'.tr(),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.yellow),
      onTap: () {
        // نبدّل اللغة لما يضغط
        if (currentLocale.languageCode == 'en') {
          context.setLocale(const Locale('ar'));
        } else {
          context.setLocale(const Locale('en'));
        }
      },
    );
  }
}