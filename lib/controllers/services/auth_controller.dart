import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucrao/views/components/snacks/snacks.dart';

class AuthController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;
  String authError = '';

  _getUser() {
    currentUser = auth.currentUser;
  }

  authVerifier(BuildContext context) async {
    auth.userChanges().listen((User? user) {
      if (user == null) {
        currentUser = user;
        Navigator.of(context).pushNamed('/signinpage');
        notifyListeners();
      } else {
        currentUser = user;
        Navigator.of(context).pushNamed('/homepage');
        notifyListeners();
      }
    });
  }

  signUpUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser != null) {
        auth.currentUser!.updateDisplayName(name);
        Navigator.of(context).pushNamed('/homepage');
      }
    } on FirebaseAuthException catch (e) {
      authError = e.code;
    }
  }

  Future<User?> signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      _getUser();
      if (context.mounted) {
        Snacks.snackBarLoginSucessful(context);
      }

      return credential.user;
    } on FirebaseAuthException catch (e) {
      authError = e.code;
      if (context.mounted) {
        if (authError == 'invalid-email') {
          Snacks.snackBarEmailWrong(context);
        } else if (authError == 'invalid-credential') {
          Snacks.snackBarPasswordWrong(context);
        }
      }
    }

    return null;
  }
}
