import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<bool> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 30),
      );

      this.latitude = position.latitude;
      this.longitude = position.longitude;

      return true;
    } catch (e) {
      print(e);
      print('Could not get location :(');
      return false;
    }
  }
}
