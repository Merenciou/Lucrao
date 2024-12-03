import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/views/components/navbar/custom_navbar.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  GlobalKey formKeyFirstApp = GlobalKey<FormState>();
  GlobalKey formKeySecondApp = GlobalKey<FormState>();
  GlobalKey formKeyThirdApp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

    return Scaffold(
      bottomNavigationBar: const CustomNavbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, top: 20),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: screenSize.height / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Aplicativo 1:',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyFirstApp,
                    child: SizedBox(
                      height: screenSize.height / 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Nome'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Taxa'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Aplicativo 2',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeySecondApp,
                    child: SizedBox(
                      height: screenSize.height / 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Nome'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Taxa'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Aplicativo 3',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyThirdApp,
                    child: SizedBox(
                      height: screenSize.height / 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Nome'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFDEE5D4),
                              label: const Text('Taxa'),
                              labelStyle: GoogleFonts.montserrat(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: const Color(0xFF78B7D0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Ativar Alerta',
                        style: GoogleFonts.montserrat(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
