import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.air),
          Icon(Icons.foggy),
          Text('Monday 29,March'),
          Icon(Icons.sunny),
          Icon(Icons.sunny_snowing)
        ],
      ),
    );
  }
}
