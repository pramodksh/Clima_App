import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenWeatherAPI{

  final String OpenWeatherAPIUrl;

  OpenWeatherAPI({required this.OpenWeatherAPIUrl});


  Future getWeatherData() async {
    print("Foo called!!!");
    var OpenWeatherAPIUrlParsed = Uri.parse(OpenWeatherAPIUrl);
    http.Response response = await http.get(OpenWeatherAPIUrlParsed);
    print('hehe'); 

    if (response.statusCode == 200){
      print(response.statusCode);
      // print(response.body);
      var data = jsonDecode(response.body);
      // var weatherDescription =  data['weather'][0]['description'];
      // print(weatherDescription);
      return data;
    }else{
      print("Some Error Occurred!!!");
      var data = jsonDecode(response.body);
        return data['message'];
    }

  }
}