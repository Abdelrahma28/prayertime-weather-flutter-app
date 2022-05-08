import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;
  //Assign city and country to get prayer time data
  String city = '';
  String country = '';
  Future getWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future getPrayerData(String city, String country) async {
    final url =
        'https://api.aladhan.com/v1/timingsByAddress?address=$city,%20$country&method=99&methodSettings=19.5,null,17.5';
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var prayerDecodedData = jsonDecode(data);
      var prayerTimings = prayerDecodedData['data']['timings'];
      print(prayerTimings);
      return prayerDecodedData;
    } else {
      print('prayer code ${response.statusCode}');
    }
  }
}
