import 'package:flutter/material.dart';

class WindHumidityWidget extends StatelessWidget {
  WindHumidityWidget({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
