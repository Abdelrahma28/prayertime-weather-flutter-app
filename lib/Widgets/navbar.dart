import 'package:flutter/material.dart';
import '../screens/weather-screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/custom-icons/my_icons_icons.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w400);
  static const List<Widget> _widgetOptions = <Widget>[
    WeatherPage(),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: NavBar._widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 25, right: 25),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: GNav(
          padding: EdgeInsets.all(20),
          duration: const Duration(milliseconds: 250),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.grey.withOpacity(0.2),
          gap: 7,
          tabs: const [
            GButton(
              icon: MyIcons.home_svgrepo_com,
              text: 'Home',
            ),
            GButton(
              icon: MyIcons.search_svgrepo_com,
              text: 'Search',
            ),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
