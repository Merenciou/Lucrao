import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    return Container(
      width: double.infinity,
      height: screenSize.height / 11,
      color: const Color(0xFFEEDF7A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settingspage');
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFDEE5D4),
              ),
              icon: const Icon(
                Icons.settings_rounded,
                size: 50,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homepage');
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFDEE5D4),
              ),
              icon: const Icon(
                Icons.home_rounded,
                size: 50,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/alertspage');
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFDEE5D4),
              ),
              icon: const Icon(
                Icons.notifications_rounded,
                size: 50,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
