import 'package:flutter/material.dart';

class CustomNavbarController extends ChangeNotifier {
  static CustomNavbarController instance = CustomNavbarController();

  int navItemIndex = 1;

  routeSettings() {
    navItemIndex = 0;
    ChangeNotifier();
  }

  routeHome() {
    navItemIndex = 1;
    ChangeNotifier();
  }

  routeAlert() {
    navItemIndex = 2;
    ChangeNotifier();
  }
}
