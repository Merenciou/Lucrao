import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location with ChangeNotifier {
  Position? startPosition;
  Position? endPosition;
  double distanceInMeters = 0.0;

  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      await Geolocator.requestPermission();
      await Geolocator.openLocationSettings();
      return Future.error('Serviço de localização está desativado!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      await Geolocator.openLocationSettings();
      if (permission == LocationPermission.denied) {
        return Future.error('Serviços de localização negados!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return Future.error(
          'O serviço de localização está desativado permanentemente, nós não conseguimos solicitar uma permissão!');
    }

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    if (startPosition == null) {
      startPosition = position;
    } else {
      endPosition = position;

      calculateDistance();
    }

    notifyListeners();

    return await Geolocator.getCurrentPosition();
  }

  void calculateDistance() async {
    if (startPosition != null && endPosition != null) {
      distanceInMeters = Geolocator.distanceBetween(
          startPosition!.latitude,
          startPosition!.longitude,
          endPosition!.latitude,
          endPosition!.longitude);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('distanceinmeters', distanceInMeters);
      notifyListeners();
    }
  }
}
