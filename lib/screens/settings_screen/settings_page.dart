import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';

const List<String> fuelList = <String>[
  'Gasolina',
  'Etanol',
  'Diesel',
];

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String dropdownValue = fuelList.first;
  GlobalKey formKeyFuelType = GlobalKey<FormState>();
  GlobalKey formKeyFuelPrice = GlobalKey<FormState>();
  GlobalKey formKeyAppRacePrice = GlobalKey<FormState>();

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
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDEE5D4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: DropdownButton(
                        value: dropdownValue,
                        underline: const SizedBox(
                          width: double.infinity,
                          height: 0,
                        ),
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        dropdownColor: const Color(0xFFDEE5D4),
                        isExpanded: true,
                        items: fuelList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
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
                    key: formKeyFuelType,
                    child: TextFormField(
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
                    key: formKeyAppRacePrice,
                    child: TextFormField(
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
                        Navigator.of(context).pushNamed('/resultpage');
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
