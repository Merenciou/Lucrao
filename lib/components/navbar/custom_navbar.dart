import 'package:flutter/material.dart';
import 'package:lucrao/controllers/custom_navbar_controller.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      child: Container(
        width: double.infinity,
        height: screenSize.height / 11,
        decoration: const BoxDecoration(
          color: Color(0xFFEEDF7A),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {
                  CustomNavbarController.instance.routeSettings();
                  Navigator.of(context).pushNamed('/settingspage');
                },
                style: IconButton.styleFrom(
                  backgroundColor:
                      CustomNavbarController.instance.navItemIndex == 0
                          ? const Color(0xFFDEE5D4)
                          : const Color(0xFFEEDF7A),
                ),
                icon: Icon(
                  Icons.settings_rounded,
                  size: CustomNavbarController.instance.navItemIndex == 0
                      ? 60
                      : 50,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {
                  CustomNavbarController.instance.routeHome();
                  Navigator.of(context).pushNamed('/homepage');
                },
                style: IconButton.styleFrom(
                  backgroundColor:
                      CustomNavbarController.instance.navItemIndex == 1
                          ? const Color(0xFFDEE5D4)
                          : const Color(0xFFEEDF7A),
                ),
                icon: Icon(
                  Icons.home_rounded,
                  size: CustomNavbarController.instance.navItemIndex == 1
                      ? 60
                      : 50,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {
                  CustomNavbarController.instance.routeAlert();
                  Navigator.of(context).pushNamed('/alertspage');
                },
                style: IconButton.styleFrom(
                  backgroundColor:
                      CustomNavbarController.instance.navItemIndex == 2
                          ? const Color(0xFFDEE5D4)
                          : const Color(0xFFEEDF7A),
                ),
                icon: Icon(
                  Icons.notifications_rounded,
                  size: CustomNavbarController.instance.navItemIndex == 2
                      ? 60
                      : 50,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
