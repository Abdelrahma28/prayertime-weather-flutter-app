import 'package:flutter/material.dart';

import '../Widgets/Wind-humidity.dart';
import '../Widgets/date-icons.dart';
import '../Widgets/prayer-time.dart';
import '../Widgets/weather-stack.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({this.locationWeather});
  final locationWeather;

  double temperature = 0.0;
  double condition = 0.0;
  String cityName = '';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void init() {
    super.initState();
    print(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: WeatherStack(),
                  flex: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        WindHumidityWidget(label: 'Wind', value: '9 Km/h'),
                        GestureDetector(
                          onTap: () {
                            print(widget.locationWeather);
                          },
                          child: PrayerTime(label: 'Fajr', time: '3:31'),
                        ),
                        WindHumidityWidget(label: 'Humidity', value: '79%'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DateWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// double temperature = decodedData['main']['temp'];
// double condition = decodedData['weather'][0]['id'];
// double cityName = decodedData['name'];
