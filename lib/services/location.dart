import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 30),
      );

      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e);
      print('Could not get location :(');
    }
  }
}
