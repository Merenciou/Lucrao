import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/views/components/navbar/custom_navbar.dart';
import 'package:lucrao/views/settings_screen/settings_functions.dart';

TextEditingController kmPerLiterController = TextEditingController();
TextEditingController kmTraveledController = TextEditingController();
TextEditingController fuelPriceController = TextEditingController();
TextEditingController raceAppController = TextEditingController();

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final formKeyKmPerLiter = GlobalKey<FormState>();
  final formKeyKmTraveled = GlobalKey<FormState>();
  final formKeyFuelPrice = GlobalKey<FormState>();
  final formKeyRaceAppPrice = GlobalKey<FormState>();

  @override
  void dispose() {
    // kmPerLiterController.dispose();
    // kmTraveledController.dispose();
    // fuelPriceController.dispose();
    // raceAppController.dispose();
    // print('disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;

    return Scaffold(
      bottomNavigationBar: const CustomNavbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
        ),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: screenSize.height / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(
                    'Autonomia do Veículo',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyKmPerLiter,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo!';
                        }
                        return null;
                      },
                      controller: kmPerLiterController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDEE5D4),
                        label: const Text('Quantos quilomêtros/litro?'),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(
                    'Quilometragem Percorrida:',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyKmTraveled,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo!';
                        }
                        return null;
                      },
                      controller: kmTraveledController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDEE5D4),
                        label: const Text('Km'),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(
                    'Preço do Combustível:',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyFuelPrice,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo!';
                        }
                        return null;
                      },
                      controller: fuelPriceController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDEE5D4),
                        label: const Text('Preço por litro'),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(
                    'Preço da corrida:',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: formKeyRaceAppPrice,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo!';
                        }
                        return null;
                      },
                      controller: raceAppController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDEE5D4),
                        label: const Text('Preço por corrida'),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Align(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKeyKmPerLiter.currentState!.validate() &&
                            formKeyKmTraveled.currentState!.validate() &&
                            formKeyFuelPrice.currentState!.validate() &&
                            formKeyRaceAppPrice.currentState!.validate()) {
                          SettingsFunctions.instance.getKmPerLiter();
                          SettingsFunctions.instance.getKmTravelled();
                          SettingsFunctions.instance.getFuelPrice();
                          SettingsFunctions.instance.getRaceAppPrice();
                          SettingsFunctions.instance.raceCalc();
                          SettingsFunctions.instance.resultText();
                          Navigator.of(context).pushNamed('/resultpage');
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
                        'Calcular',
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
