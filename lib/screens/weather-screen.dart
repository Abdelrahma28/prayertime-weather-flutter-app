import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp2/utilities/current-prayer-time.dart';

import '../Widgets/Wind-humidity.dart';
import '../Widgets/date-icons.dart';
import '../Widgets/prayer-time.dart';
import '../Widgets/weather-stack.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({this.locationWeather, this.locationPrayer});
  final dynamic locationPrayer;
  final dynamic locationWeather;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String cityName = '';
  String temperature = '';
  double windSpeed = 0.0;
  int humidity = 0;
  int condition = 0;
  String time = '';
  String label = '';
  String currDate = '';

  @override
  void initState() {
    updateUI(widget.locationWeather, widget.locationPrayer);
    super.initState();
  }

  void updateUI(dynamic weatherData, dynamic prayerData) {
    //WeatherData
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt().toString();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    windSpeed = widget.locationWeather['wind']['speed'];
    humidity = widget.locationWeather['main']['humidity'];
    //PrayerData
    PrayerTime prayerTime = PrayerTime(apiPrayerData: prayerData);
    time = prayerTime.PrayerTimeCalculator();
    label = prayerTime.label;
    var data = DateTime.now();
    //Current Date
    currDate = DateFormat('EEEE, MMM d').format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: WeatherStack(
                    cityName: cityName,
                    degree: temperature,
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
                            value: '${windSpeed.toString()} Km/h'),
                        PrayerTimeWidget(
                          label: label,
                          time: time,
                        ),
                        WindHumidityWidget(
                            label: 'Humidity', value: '$humidity%'.toString()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DateWidget(currDate: currDate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
