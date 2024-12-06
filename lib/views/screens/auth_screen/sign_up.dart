// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/views/components/buttons/button_switch_auth.dart';
// import 'package:lucrao/controllers/services/auth_service.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
TextEditingController nameController = TextEditingController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool signSwitch = true;
  bool showPassword = true;

  void _signUpAuth(context) async {
    // final AuthService auth = AuthService();

    // String email = emailController.text;
    // String password = passwordController.text;

    // User? user = await auth.signUpWithEmailAndPassword(email, password);

    // if (user != null) {
    //   if (mounted) {
    //     Warnings.snackBarSignUpSucessfull(context);
    //   }

    //   await UserController(name: nameController.text).setName();
    //   nameController.clear();
    // }
    // if (authError == 'email-already-in-use') {
    //   if (mounted) {
    //     Warnings.snackBarEmailAlreadInUse(context);
    //   }
    // }
  }

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
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      SizedBox(
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.montserrat(fontSize: 18),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.montserrat(fontSize: 14),
                            label: Text(
                              'Nome',
                              style: GoogleFonts.montserrat(fontSize: 18),
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
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            style: GoogleFonts.montserrat(fontSize: 18),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Preencha este campo!';
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value)) {
                                return 'Insira um email válido';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              errorStyle: GoogleFonts.montserrat(fontSize: 14),
                              label: Text(
                                'Email',
                                style: GoogleFonts.montserrat(fontSize: 18),
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
                      ),
                      SizedBox(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: passwordController,
                          obscureText: showPassword,
                          style: GoogleFonts.montserrat(fontSize: 18),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            if (value.length < 6) {
                              return 'Sua senha deve conter, no minímo, 6 caracteres!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.montserrat(fontSize: 14),
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
                            label: Text(
                              'Senha',
                              style: GoogleFonts.montserrat(fontSize: 18),
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
                            controller: passwordConfirmController,
                            textInputAction: TextInputAction.go,
                            obscureText: showPassword,
                            style: GoogleFonts.montserrat(fontSize: 18),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Preencha este campo!';
                              }
                              if (value != passwordController.text) {
                                return 'As senhas não coincidem!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              errorStyle: GoogleFonts.montserrat(fontSize: 14),
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
                              label: Text(
                                'Confirme sua senha',
                                style: GoogleFonts.montserrat(fontSize: 18),
                              ),
                              labelStyle: const TextStyle(
                                color: Color(0xFF000000),
                              ),
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.red),
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
                    backgroundColor: const Color(0XFF88C273),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUpAuth(context);
                      emailController.clear();
                      passwordController.clear();
                      passwordConfirmController.clear();
                    }
                  },
                  child: Text(
                    'Cadastrar',
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
