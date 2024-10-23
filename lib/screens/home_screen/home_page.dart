import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucrao/components/charts/gain_monthly_chart.dart';
import 'package:lucrao/components/charts/gain_weekly_chart.dart';
import 'package:lucrao/components/navbar/custom_navbar.dart';
import 'package:lucrao/controllers/chart_temporal_controller.dart';

const List<String> fuelList = <String>['Semanal', 'Mensal'];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = fuelList.first;

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    return Scaffold(
      bottomNavigationBar: const CustomNavbar(),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 100),
            backgroundColor: const Color(0xFFDEE5D4)),
        child: const Icon(
          Icons.drive_eta_rounded,
          color: Colors.black,
          size: 40,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: screenSize.height / 1.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 0),
                child: Text(
                  'Bom dia, para onde iremos hoje? :)',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDEE5D4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: DropdownButton(
                      value: dropdownValue,
                      underline: const SizedBox(
                        width: double.infinity,
                        height: 0,
                      ),
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          if (dropdownValue == 'Semanal') {
                            ChartTemporalController.instance.chartWeekly();
                          } else if (dropdownValue == 'Mensal') {
                            ChartTemporalController.instance.chartMonthly();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width / 1.1,
                height: screenSize.height / 2.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFFDEE5D4),
                ),
                child: ChartTemporalController.instance.chartIndex == 0
                    ? const GainWeeklyChart()
                    : const GainMonthlyChart(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 40),
                child: Container(
                  width: screenSize.width / 1.1,
                  height: 70,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFDEE5D4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Lucro de Hoje:',
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'R\$500,00',
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ],
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
