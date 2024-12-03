import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/controllers/services/location.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int touchTime = 0;

  @override
  Widget build(BuildContext context) {
    final location = context.watch<Location>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/homepage');
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
        child: SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Pressione o botão para iniciar!',
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  location.determinePosition();

                  touchTime++;
                  if (touchTime >= 2) {
                    Navigator.of(context).pushNamed('/resultdistancepage');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(220),
                    ),
                  ),
                  minimumSize: const Size(250, 250),
                  backgroundColor: location.startPosition == null
                      ? const Color(0xFF78B7D0)
                      : const Color(0xFFDE7C7D),
                ),
                child: Text(
                  location.startPosition == null ? 'Iniciar' : 'Finalizar',
                  style: GoogleFonts.montserrat(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              // Text(location.startPosition == null
              //     ? 'Pressione o botão para iniciar'
              //     : 'Ponto inicial: ${location.startPosition!.latitude}, ${location.startPosition!.longitude}'),
              // Text(
              //   location.endPosition == null
              //       ? 'Pressione o botão novamente para marcar o ponto final'
              //       : 'Ponto final: ${location.endPosition!.latitude}, ${location.endPosition!.longitude}',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
