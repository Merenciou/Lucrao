import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationFunction extends ChangeNotifier {
  static LocationFunction instance = LocationFunction();

  double? kmTraveled = 0;
  double? kmPerLiter = 0;
  double? fuelPrice = 0;
  double? cust = 0;
  double? get _cust => cust;

  getTravelDatas() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference autonomyCollection =
        firestore.collection('autonomyCollection');
    DocumentSnapshot documentSnapshot =
        await autonomyCollection.doc('autonomy').get();

    if (!documentSnapshot.exists) return null;

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    kmPerLiter = data['autonomy'];
    fuelPrice = data['fuel_price'];

    kmTraveled = prefs.getDouble('distanceinmeters');

    if (kmTraveled != null && kmPerLiter != null && fuelPrice != null) {
      cust = (kmTraveled! / kmPerLiter!) * fuelPrice!;
      await prefs.setDouble('cust', cust ?? 0);
      notifyListeners();
    }

    print('KMPERLITER:::::::::::::::: $kmPerLiter');
    print('FUELPRICE:::::::::::::::: $fuelPrice');
    print('DISTANCEINMETERS:::::::::::::::: $kmTraveled');
    print('CUST::::::::::::::::::::: $cust');
  }

  Future<double?> getCust() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    cust = prefs.getDouble('cust');

    return _cust;
  }
}
