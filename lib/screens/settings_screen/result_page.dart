import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    return Scaffold(
      bottomNavigationBar: const CustomNavbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 40,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
              child: SizedBox(
                height: screenSize.height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 270,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xFFDEE5D4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Taxa de lucro:',
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          Text(
                            'R\$6,36',
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Percentual de lucro:',
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          Text(
                            '60%',
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sua margem de lucro está:',
                      style: GoogleFonts.montserrat(fontSize: 18),
                    ),
                    Text(
                      'Boa',
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SvgPicture.asset(
                      'assets/images/growning.svg',
                      width: 200,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF78B7D0),
                        minimumSize: const Size(double.infinity, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Enviar Relatório',
                        style: GoogleFonts.montserrat(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
