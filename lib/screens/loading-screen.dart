
import 'package:flutter/material.dart';
import 'package:weatherapp2/services/location.dart';
import 'package:weatherapp2/services/networking.dart';
const apiKey='fba4925a3b0974cd776fd2035ea3199c';
// DateTime dateTime = DateTime.now();
// String formattedTime =DateFormat.Hms().format(dateTime);
// print(formattedTime);

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude=0.0;
  double latitude=0.0;

  @override
  void initState() {
    super.initState();
   getLocationData();
  }


  Future <void> getLocationData() async {
    //Fetch user location to get longitude and latitude
    Location location = Location();
    await location.getCurrentLocation();
    longitude=location.lon;
    latitude=location.lat;
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    //create network object to get decoded data
    NetworkHelper networkHelper =NetworkHelper(url: url);
    var weatherData = await networkHelper.getWeatherData();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            'get location',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            getLocationData();
          },
        ),
      ),
    );
  }
}
