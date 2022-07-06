import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()  async{
            LocationService myLocation = LocationService();
            await myLocation.getCurrentLocation();
            print(myLocation.getLong());
            print(myLocation.getLat());

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
