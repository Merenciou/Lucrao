import 'package:flutter/material.dart';

class SignSwitchController extends ChangeNotifier {
  bool signSwitch = false;

  switchState() {
    signSwitch = !signSwitch;
    notifyListeners();
  }
}
