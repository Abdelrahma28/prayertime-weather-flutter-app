import 'package:flutter/material.dart';

import '../Widgets/Wind-humidity.dart';
import '../Widgets/date-icons.dart';
import '../Widgets/prayer-time.dart';
import '../Widgets/weather-stack.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);



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
                        PrayerTime(label: 'Fajr',time: '3:31'),
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
