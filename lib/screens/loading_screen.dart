import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;
  var openWeatherAPIKeyVar = dotenv.env['openWeatherAPIKey'];

  void getWeather() async {
    var OpenWeatherAPIUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${openWeatherAPIKeyVar}');

    Response response = await get(OpenWeatherAPIUrl);

    // print(response.body);
    var data = jsonDecode(response.body);
    var weatherDescription =  data['weather'][0]['description'];
    print(weatherDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            LocationService myLocation = LocationService();
            await myLocation.getCurrentLocation();
            longitude = await myLocation.getLong();
            latitude = await myLocation.getLat();
            getWeather();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
