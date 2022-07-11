
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/networking.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;
  var openWeatherAPIKeyVar = dotenv.env['openWeatherAPIKey'];
  var result;


  @override

  void initState(){
    getWeather();
  }

  void getWeather()async{
    LocationService myLocation = LocationService();
    await myLocation.getCurrentLocation();
    longitude = await myLocation.getLong();
    latitude = await myLocation.getLat();
    var res = await OpenWeatherAPI(OpenWeatherAPIUrl: 'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=b013729da264a9f8bb365ba74e4f4c89&units=metric');
    result = await res.getWeatherData();
    // print("Result : ${result}");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen( locationWeather:result);
    }));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
