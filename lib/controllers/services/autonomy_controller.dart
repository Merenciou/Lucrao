import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lucrao/views/screens/location_screen/location_null_screen.dart';

class AutonomyController {
  double? kmPerLiter;
  double? fuelPrice;
  double? carDatas;

  double? get _carDatas => carDatas;

  void setAutonomy() async {
    kmPerLiter = double.tryParse(kmPerLiterNullScreenController.text);
    fuelPrice = double.tryParse(fuelPriceNullScreenController.text);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference autonomyCollection =
        firestore.collection('autonomyCollection');

    await autonomyCollection.doc('autonomy').set(
      {
        'autonomy': kmPerLiter,
        'fuel_price': fuelPrice,
      },
      SetOptions(merge: true),
    ).onError((e, _) => print('ERRO É:::::::::::::::: $e'));
  }

  Future<double?> getAutonomy() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference autonomyCollection =
        firestore.collection('autonomyCollection');

    DocumentSnapshot documentSnapshot =
        await autonomyCollection.doc('autonomy').get();

    if (!documentSnapshot.exists) return null;

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    carDatas = data['autonomy'];

    return _carDatas;
  }
}
