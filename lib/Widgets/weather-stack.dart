import 'package:flutter/material.dart';

import 'Degree.dart';

class WeatherStack extends StatelessWidget {
  const WeatherStack({Key? key, required this.degree, required this.cityName})
      : super(key: key);
  final double degree;
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      overflow: Overflow.visible,
      children: [
        Column(
          children: [
            Text(
              cityName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Chance of Rain 3%',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.6)),
            ),
            DegreeWidget(degree: degree.toInt().toString()),
          ],
        ),
        Positioned(
          top: 150,
          child: SizedBox(
            height: 150,
            child: Image.asset(
              'images/16.png',
            ),
          ),
        ),
      ],
    );
  }
}
