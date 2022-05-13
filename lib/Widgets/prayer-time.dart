import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  PrayerTimeWidget({required this.label, required this.time});
  final String label;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      height: 70,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: Colors.black),
          ),
          Text(
            time,
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
