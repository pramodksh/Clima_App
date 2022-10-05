
# Clima

Clima is a Weather App which shows the temperature of current location

The App helps to get the Weather(specifically temperature) of users GPS location.
App gets access to the devices location and fetches the coordinates
which is used as a parameter to make API call. In response the app recieves a JSON data
which contains data such as temperature, humidity, wind, clouds, type of weather etc.

## How to run app

1. Clone the project
2. Create .env file and add your API key in a variable "OPEN_WEATHER_API_KEY"
3. Run the app


## Packages Used

1. geolocator : https://pub.dev/packages/geolocator

To get access to android systems location add following code
"<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />"
in AndroidManifest.xml file (located under android/app/src/main)



2. http : https://pub.dev/packages/http


3. flutter_spinkit : https://pub.dev/packages/flutter_spinkit


## API Used

OpenWeatherMap : https://openweathermap.org/api

