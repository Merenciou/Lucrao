import 'package:flutter/material.dart';
import 'package:lucrao/controllers/services/custom_navbar_controller.dart';
import 'package:lucrao/controllers/services/sign_switch_controller.dart';
import 'package:lucrao/controllers/services/switch_screen_case_null_controller.dart';
import 'package:lucrao/views/screens/alerts_screen/alerts_page.dart';
import 'package:lucrao/views/screens/auth_screen/auth_screen.dart';
import 'package:lucrao/views/screens/home_screen/home_page.dart';
import 'package:lucrao/views/screens/location_screen/location_function.dart';
import 'package:lucrao/views/screens/location_screen/location_null_screen.dart';
import 'package:lucrao/views/screens/location_screen/location_screen.dart';
import 'package:lucrao/views/screens/location_screen/result_distance.dart';
import 'package:lucrao/views/screens/settings_screen/result_page.dart';
import 'package:lucrao/views/screens/settings_screen/settings_functions.dart';
import 'package:lucrao/views/screens/settings_screen/settings_page.dart';
import 'package:lucrao/controllers/services/location.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<CustomNavbarController>(
          create: (_) => CustomNavbarController(),
        ),
        Provider<SettingsFunctions>(
          create: (_) => SettingsFunctions(),
        ),
        ChangeNotifierProvider<Location>(
          create: (_) => Location(),
        ),
        ChangeNotifierProvider<LocationFunction>(
          create: (_) => LocationFunction(),
        ),
        ChangeNotifierProvider<SignSwitchController>(
          create: (_) => SignSwitchController(),
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
        '/locationpage': (context) => const LocationScreen(),
        '/locationnullpage': (context) => const LocationNullScreen(),
        '/resultdistancepage': (context) => const ResultDistance(),
        '/switchscreencasenull': (context) => const SwitchScreenCaseNull(),
      },
      home: const Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: AuthScreen(),
      ),
    );
  }
}
