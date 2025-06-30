import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heart_guardian/screen/heart_view.dart';
import 'package:heart_guardian/services/heart_monitor_service.dart';
import 'package:heart_guardian/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heart_guardian/core/theme_notifier.dart';
import 'package:heart_guardian/firebase_options.dart';
import 'package:heart_guardian/screen/splash_screen.dart';
import 'package:heart_guardian/screen/notification_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.init();
  HeartMonitorService.startMonitoring();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'Heart Guardian',
          theme: themeNotifier.lightTheme,
          darkTheme: themeNotifier.darkTheme,
          themeMode: themeNotifier.currentTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: const SplashScreen(),
          routes: {
            '/notificationScreen': (context) => const NotificationScreen(),
            '/heartView': (context) => const HeartView(),
          },
        );
      },
    );
  }
}
