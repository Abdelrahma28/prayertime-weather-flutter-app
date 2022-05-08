import 'package:flutter/material.dart';

class DegreeWidget extends StatelessWidget {
  const DegreeWidget({Key? key, required this.degree}) : super(key: key);
  final String degree;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const RadialGradient(
          center: Alignment.topCenter,
          radius: 1.1,
          colors: <Color>[Colors.white, Colors.white12],
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: Text(
        degree,
        style: TextStyle(
            fontSize: 130.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
      ),
    );
  }
}
