import 'package:flutter/material.dart';

class CustomNavbarController extends ChangeNotifier {
  static CustomNavbarController instance = CustomNavbarController();

  int navItemIndex = 1;

  routeSettings() {
    navItemIndex = 0;
    notifyListeners();
  }

  routeHome() {
    navItemIndex = 1;
    notifyListeners();
  }

  routeAlert() {
    navItemIndex = 2;
    notifyListeners();
  }
}
