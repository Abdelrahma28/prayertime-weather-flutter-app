import 'package:flutter/material.dart';
import 'package:weatherapp2/utilities/current-prayer-time.dart';

import '../Widgets/Wind-humidity.dart';
import '../Widgets/date-icons.dart';
import '../Widgets/prayer-time.dart';
import '../Widgets/weather-stack.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({this.locationWeather, this.prayerTime});
  final prayerTime;
  final locationWeather;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String prayer = '';
  String label = '';
  @override
  void initState() {
    CurrentPrayer currentPrayer = CurrentPrayer(prayerTime: widget.prayerTime);
    prayer = currentPrayer.timeCalculator();
    label = currentPrayer.label;
    super.initState();
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
                  child: WeatherStack(
                    cityName: widget.locationWeather['name'],
                    degree: widget.locationWeather['main']['temp'],
                  ),
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
                        WindHumidityWidget(
                            label: 'Wind  Speed',
                            value:
                                '${widget.locationWeather['wind']['speed'].toString()} Km/h'),
                        GestureDetector(
                          onTap: () {
                            print(widget.locationWeather);
                            print(widget.locationWeather['main']['humidity']);
                          },
                          child: PrayerTime(label: label, time: prayer),
                        ),
                        WindHumidityWidget(
                            label: 'Humidity',
                            value:
                                '${widget.locationWeather['main']['humidity']}%'
                                    .toString()),
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
