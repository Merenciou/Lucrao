import 'package:flutter/material.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var deviceData = MediaQuery.of(context);
    // var screenSize = deviceData.size;
    return const Scaffold(
      bottomNavigationBar: CustomNavbar(),
      body: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
