import 'package:flutter/material.dart';
import 'package:lucrao/controllers/services/autonomy_controller.dart';
import 'package:lucrao/views/location_screen/location_null_screen.dart';
import 'package:lucrao/views/location_screen/location_screen.dart';

class SwitchScreenCaseNull extends StatefulWidget {
  const SwitchScreenCaseNull({super.key});

  @override
  State<SwitchScreenCaseNull> createState() => _SwitchScreenCaseNullState();
}

class _SwitchScreenCaseNullState extends State<SwitchScreenCaseNull> {
  late Future<double?> carData;
  @override
  void initState() {
    carData = AutonomyController().getAutonomy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: carData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return const LocationScreen();
        } else if (snapshot.hasError) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const LocationNullScreen();
        }
      },
    );
  }
}
