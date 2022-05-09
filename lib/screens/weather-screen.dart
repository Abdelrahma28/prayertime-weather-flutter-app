import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String deviceTimeHours = DateFormat('H').format(now);
    String deviceTimeMinutes = DateFormat('m').format(now);
    int d = int.parse(deviceTimeHours);
    String apiTime = widget.prayerTime['data']['timings']['Maghrib'];
    var prayerTimeHours = DateFormat.Hm().parse(apiTime).hour;
    var prayerTimeMinutes = DateFormat.Hm().parse(apiTime).minute;
    String timeConverter() {
      var currentPrayer = '';
      if (prayerTimeHours < d) {
        return currentPrayer = prayerTimeHours.toString();
      } else {
        return currentPrayer = deviceTimeHours.toString();
      }
    }

    String time = timeConverter();
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
                          child: PrayerTime(label: 'Fajr', time: time),
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
