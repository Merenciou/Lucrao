import 'package:flutter/material.dart';
import 'package:lucrao/controllers/custom_navbar_controller.dart';
import 'package:lucrao/screens/alerts_screen/alerts_page.dart';
import 'package:lucrao/screens/home_screen/home_page.dart';
import 'package:lucrao/screens/settings_screen/result_page.dart';
import 'package:lucrao/screens/settings_screen/settings_functions.dart';
import 'package:lucrao/screens/settings_screen/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CustomNavbarController>(
          create: (_) => CustomNavbarController(),
        ),
        Provider<SettingsFunctions>(
          create: (_) => SettingsFunctions(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/settingspage': (context) => const SettingsPage(),
        '/homepage': (context) => const HomePage(),
        '/alertspage': (context) => const AlertsPage(),
        '/resultpage': (context) => const ResultPage(),
      },
      home: const Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: HomePage(),
      ),
    );
  }
}
