// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/controllers/services/auth_controller.dart';
import 'package:lucrao/views/components/buttons/button_switch_auth.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
TextEditingController nameController = TextEditingController();

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool signSwitch = true;
  bool showPassword = true;
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFEEDF7A),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ButtonSwitchAuth(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Preencha este campo!';
                          }
                          return null;
                        },
                        style: GoogleFonts.montserrat(fontSize: 18),
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.montserrat(fontSize: 14),
                          label: Text(
                            'Email',
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFF000000),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFF000000),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Color(0xFF000000),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: showPassword,
                          style: GoogleFonts.montserrat(fontSize: 18),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(
                                  showPassword
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: Colors.black38,
                                )),
                            errorStyle: GoogleFonts.montserrat(fontSize: 14),
                            label: Text(
                              'Senha',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF000000),
                              ),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFF000000)),
                            floatingLabelStyle: const TextStyle(
                              color: Color(0xFF000000),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    backgroundColor: const Color(0xFF78B7D0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String email = emailController.text;
                      String password = passwordController.text;
                      _authController.signInUser(
                          email: email, password: password, context: context);

                      emailController.clear();
                      passwordController.clear();
                      passwordConfirmController.clear();
                    }
                  },
                  child: Text(
                    'Entrar',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
