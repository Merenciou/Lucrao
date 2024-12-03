import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/controllers/services/autonomy_controller.dart';

final TextEditingController kmPerLiterNullScreenController =
    TextEditingController();
final TextEditingController fuelPriceNullScreenController =
    TextEditingController();

class LocationNullScreen extends StatefulWidget {
  const LocationNullScreen({super.key});

  @override
  State<LocationNullScreen> createState() => _LocationNullScreenState();
}

class _LocationNullScreenState extends State<LocationNullScreen> {
  final GlobalKey<FormState> _nullForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Antes de começar,\n preencha esses dados! :)',
                  style: GoogleFonts.montserrat(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _nullForm,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, preencha este campo!';
                          }
                          return null;
                        },
                        controller: kmPerLiterNullScreenController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDEE5D4),
                          label: const Text('Autonomia do Veículo'),
                          labelStyle: GoogleFonts.montserrat(),
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
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, preencha este campo!';
                          }
                          return null;
                        },
                        controller: fuelPriceNullScreenController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDEE5D4),
                          label: const Text('Preço do Combustível:'),
                          labelStyle: GoogleFonts.montserrat(),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nullForm.currentState!.validate()) {
                    AutonomyController().setAutonomy();
                    Navigator.of(context).pushNamed('/locationpage');
                  }
                },
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
                  'Continuar',
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
    );
  }
}
