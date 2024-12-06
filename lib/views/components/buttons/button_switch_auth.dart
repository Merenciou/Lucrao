import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/controllers/services/sign_switch_controller.dart';
import 'package:provider/provider.dart';

class ButtonSwitchAuth extends StatefulWidget {
  const ButtonSwitchAuth({super.key});

  @override
  State<ButtonSwitchAuth> createState() => _ButtonSwitchAuthState();
}

class _ButtonSwitchAuthState extends State<ButtonSwitchAuth> {
  @override
  Widget build(BuildContext context) {
    final signSwitchController = context.watch<SignSwitchController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 310,
        height: 50,
        child:
            signSwitchController.signSwitch ? signUpButton() : signInButton(),
      ),
    );
  }

  Widget signInButton() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    final signSwitchController = context.watch<SignSwitchController>();

    return Stack(
      children: [
        Positioned(
          right: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.380, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              backgroundColor: const Color(0XFF88C273),
            ),
            onPressed: () {
              setState(() {
                signSwitchController.switchState();
              });
            },
            child: Text(
              'Cadastrar',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        Positioned(
          left: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.380, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              backgroundColor: const Color(0xFF78B7D0),
            ),
            onPressed: () {
              setState(() {
                signSwitchController.switchState();
              });
            },
            child: Text(
              'Entrar',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpButton() {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    final signSwitchController = context.watch<SignSwitchController>();

    return Stack(
      children: [
        Positioned(
          left: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.380, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              backgroundColor: const Color(0xFF78B7D0),
            ),
            onPressed: () {
              setState(() {
                signSwitchController.switchState();
              });
            },
            child: Text(
              'Entrar',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        Positioned(
          right: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.380, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              backgroundColor: const Color(0XFF88C273),
            ),
            onPressed: () {
              setState(() {
                signSwitchController.switchState();
              });
            },
            child: Text(
              'Cadastrar',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
