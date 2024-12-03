import 'package:flutter/material.dart';
import 'package:lucrao/views/settings_screen/settings_page.dart';

class SettingsFunctions extends ChangeNotifier {
  static SettingsFunctions instance = SettingsFunctions();

  double? kmPerLiter = 0;
  double? kmTraveled = 0;
  double? fuelPrice = 0;
  double? raceAppPrice = 0;
  double? consuption = 0;
  double? gainRace = 0;
  String? gainRaceString = '0';
  double? percentageGainRace = 0;
  String? percentageGainRaceString = '0';
  List<String> gainMarginList = [
    'Ruim',
    'Razoável',
    'Boa',
    'Ótima',
  ];
  String? gainMargin;

  getKmPerLiter() {
    kmPerLiter = double.tryParse(kmPerLiterController.text);
    notifyListeners();
  }

  getKmTravelled() {
    kmTraveled = double.tryParse(kmTraveledController.text);
    notifyListeners();
  }

  getFuelPrice() {
    fuelPrice = double.tryParse(fuelPriceController.text);
    notifyListeners();
  }

  getRaceAppPrice() {
    raceAppPrice = double.tryParse(raceAppController.text);
    notifyListeners();
  }

  raceCalc() {
    if (kmPerLiter != 0 &&
        kmTraveled != 0 &&
        fuelPrice != 0 &&
        raceAppPrice != 0) {
      consuption = (kmTraveled! / kmPerLiter!) * fuelPrice!;
      gainRaceString = (raceAppPrice! - consuption!).toStringAsFixed(2);
      gainRace = double.tryParse(gainRaceString!);
      percentageGainRaceString =
          (((raceAppPrice! - consuption!) * 100) / raceAppPrice!)
              .toStringAsFixed(1);
      percentageGainRace = double.tryParse(percentageGainRaceString!);
    }
  }

  resultText() {
    switch (percentageGainRace!) {
      case >= 0 && <= 25:
        gainMargin = gainMarginList[0];
        break;
      case >= 26 && <= 50:
        gainMargin = gainMarginList[1];
        break;
      case >= 51 && <= 75:
        gainMargin = gainMarginList[2];
        break;
      case >= 76:
        gainMargin = gainMarginList[3];
        break;
      default:
    }
  }
}
