import 'package:geolocator/geolocator.dart';

class Location {
   double latitude = 0.0; // Инициализация значением по умолчанию
   double longitude = 0.0; // Инициализация значением по умолчанию

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
      // Если возникла ошибка, установим значения по умолчанию
      latitude = 0.0;
      longitude = 0.0;
    }
  }
}
