import 'package:flutter/material.dart';
import 'package:lucrao/controllers/services/sign_switch_controller.dart';
import 'package:lucrao/views/screens/auth_screen/sign_in.dart';
import 'package:lucrao/views/screens/auth_screen/sign_up.dart';
import 'package:provider/provider.dart';

class AuthSwitchScreen extends StatefulWidget {
  const AuthSwitchScreen({super.key});

  @override
  State<AuthSwitchScreen> createState() => _AuthSwitchScreenState();
}

class _AuthSwitchScreenState extends State<AuthSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    final signSwitchController = context.watch<SignSwitchController>();
    return signSwitchController.signSwitch ? const SignUp() : const SignIn();
  }
}
