import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
 const  DateWidget({Key? key, required this.currDate}) : super(key: key);
  final String currDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Icon(Icons.air),
          Icon(Icons.foggy),
          Text(currDate),
          Icon(Icons.sunny),
          Icon(Icons.sunny_snowing)
        ],
      ),
    );
  }
}
