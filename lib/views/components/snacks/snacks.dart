import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Snacks {
  static void snackBarLoginSucessful(BuildContext context) {
    var snackBarLoginSucessful = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1400),
      backgroundColor: const Color(0XFF79AC78),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.verified,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Seja bem vindo!',
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBarLoginSucessful);
  }

  static void snackBarEmailWrong(BuildContext context) {
    var snackBarEmailWrong = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 3000),
        backgroundColor: const Color(0xFFF38BA0),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('Digite corretamente o seu email',
                  style: GoogleFonts.montserrat(color: Colors.white)),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarEmailWrong);
  }

  static void snackBarPasswordWrong(BuildContext context) {
    var snackBarPasswordWrong = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 3000),
        backgroundColor: const Color(0xFFF38BA0),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Email ou senha incorreto!',
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarPasswordWrong);
  }

  static void snackBarSignUpSucessfull(BuildContext context) {
    var snackBarSucess = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1700),
        backgroundColor: const Color(0XFF79AC78),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('Cadastro sucedido! :)',
                  style: GoogleFonts.montserrat(color: Colors.white)),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  static void snackBarEmailAlreadInUse(BuildContext context) {
    var snackBarSucess = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 3000),
        backgroundColor: const Color(0xFFF38BA0),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('Este email já está cadastrado!',
                  style: GoogleFonts.montserrat(color: Colors.white)),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  static void snackBarUserDeletedSucessful(BuildContext context) {
    var snackBarUserDeletedSucessful = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1600),
      backgroundColor: const Color(0XFF79AC78),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.verified,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Usuário excluido!',
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBarUserDeletedSucessful);
  }
}
