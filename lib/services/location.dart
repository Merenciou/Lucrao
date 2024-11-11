import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      await Geolocator.requestPermission();
      return Future.error('Serviço de localização está desativado!');
    } else {
      print('Serviço de localização está ativado!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Serviços de localização negados!');
      } else {
        print('Serviço de localização foi permitido!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'O serviço de localização está desativado permanentemente, nós não conseguimos solicitar uma permissão!');
    } else {
      print('Serviço de localização não está negado para sempre mais!');
    }

    return await Geolocator.getCurrentPosition();
  }
}
