import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/services/location.dart';
import 'package:provider/provider.dart';

class ResultDistance extends StatefulWidget {
  const ResultDistance({super.key});

  @override
  State<ResultDistance> createState() => _ResultDistanceState();
}

class _ResultDistanceState extends State<ResultDistance> {
  @override
  Widget build(BuildContext context) {
    final location = context.watch<Location>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/locationpage');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFFEEDF7A),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Calcular distância',
            style: GoogleFonts.montserrat(fontSize: 22),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              child: SvgPicture.asset('./assets/images/result_distance.svg'),
            ),
            Container(
              width: 350,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFFDEE5D4),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Km Percorridos: ',
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${location.distanceInMeters.toStringAsFixed(2)} km',
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    width: 200,
                    height: 1,
                    color: const Color(0xFF8B8B8B),
                  ),
                  Text(
                    'Despesa: ',
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'R\$ 50,00',
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
