import 'package:flutter/material.dart';
import 'Widgets/navbar.dart';
import 'screens/loading-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueAccent.withOpacity(1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFFFFFF), secondary: Colors.blueAccent),
      ),
      home: SafeArea(
        child: LoadingScreen(),
      ),
    );
  }
}
