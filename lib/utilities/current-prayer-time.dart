import 'dart:html';

import 'package:intl/intl.dart';

class PrayerTime {
  final apiPrayerData;

  PrayerTime({required this.apiPrayerData});

  String label = '';

  String currentPrayer(String curr) {
    label = curr;
    String data = apiPrayerData['data']['timings'][curr];
    DateTime timeConversion = DateFormat.Hm().parse(data);
    String currPrayer = DateFormat('h:mm').format(timeConversion);
    return currPrayer;
  }

  String PrayerTimeCalculator() {
    String dateTime = DateFormat('HH:mm').format(DateTime.now());
    DateTime deviceTime = DateFormat("HH:mm").parse(dateTime);
    DateTime getDhuhrTime = getConvertedPrayerTime('Dhuhr');
    DateTime getFajrTime = getConvertedPrayerTime('Fajr');
    DateTime getAsrTime = getConvertedPrayerTime('Asr');
    DateTime getMaghribTime = getConvertedPrayerTime('Maghrib');
    DateTime getIshaTime = getConvertedPrayerTime('Isha');

    print(apiPrayerData['data']['timings']);
    print(deviceTime);
    if (deviceTime.isBefore(getDhuhrTime) && deviceTime.isAfter(getFajrTime)) {
      return currentPrayer('Dhuhr');
    } else if (deviceTime.isBefore(getAsrTime) &&
        deviceTime.isAfter(getDhuhrTime)) {
      return currentPrayer('Asr');
    } else if (deviceTime.isBefore(getMaghribTime) &&
        deviceTime.isAfter(getAsrTime)) {
      return currentPrayer('Maghrib');
    } else if (deviceTime.isBefore(getIshaTime) &&
        deviceTime.isAfter(getMaghribTime)) {
      return currentPrayer('Isha');
    } else {
      return currentPrayer('Fajr');
    }
  }

  DateTime getConvertedPrayerTime(String currentPrayer) {
    String apiDate = getPrayerTime(currentPrayer);
    DateTime apiTime = DateFormat('hh:mm').parse(apiDate);

    return apiTime;
  }

  String getPrayerTime(String curr) {
    return apiPrayerData['data']['timings'][curr];
  }
}
