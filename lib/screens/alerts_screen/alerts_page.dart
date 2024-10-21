import 'package:flutter/material.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavbar(),
      body: Center(
        child: Text('ALERTS PAGE'),
      ),
    );
  }
}
