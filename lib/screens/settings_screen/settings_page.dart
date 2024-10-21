import 'package:flutter/material.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavbar(),
      body: Center(
        child: Text('SETTINGS PAGE'),
      ),
    );
  }
}
