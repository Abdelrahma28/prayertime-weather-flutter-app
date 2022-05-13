import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp2/services/location.dart';
import 'package:weatherapp2/services/networking.dart';

import '../Widgets/navbar.dart';

const apiKey = 'fba4925a3b0974cd776fd2035ea3199c';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    //Fetch user location to get longitude and latitude
    Location location = Location();
    await location.getCurrentLocation();
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=$apiKey&units=metric';

    //create network object to get decoded data
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getWeatherData();
    String country = weatherData['sys']['country'];

    String city = weatherData['name'];
    var prayerData = await networkHelper.getPrayerData(city, country);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NavBar(
            weatherData: weatherData,
            prayerTime: prayerData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
