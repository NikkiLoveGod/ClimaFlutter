import 'dart:math';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/secrets.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    this.getLocationData();
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${kOpenWeatherApiKey}';

    Networking networking = Networking(url: url);
    var weatherData = await networking.get();
    print(weatherData);
  }

  Future getWeather() async {
    //
    // String cityName = weatherData['name'];
    // int condition = weatherData['weather'][0]['id'];
    // double temp = weatherData['main']['temp'];

    // print({
    //   cityName,
    //   condition,
    //   temp,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Random().nextInt(100000).toString()),
            FlatButton(
              onPressed: this.getLocationData,
              child: Text('Get weather'),
            ),
          ],
        ),
      ),
    );
  }
}
