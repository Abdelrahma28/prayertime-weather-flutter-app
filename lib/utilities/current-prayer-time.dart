import 'package:intl/intl.dart';

class CurrentPrayer {
  final prayerTime;
  CurrentPrayer({required this.prayerTime});
  String label = '';
  String currentPray(String curr) {
    label = curr;
    String data = prayerTime['data']['timings'][curr];
    DateTime timeConversion = DateFormat.Hm().parse(data);
    String currPrayer = DateFormat('h:mm').format(timeConversion);
    return currPrayer;
  }

  String timeCalculator() {
    String currentPrayer = '';
    //get current time
    DateTime now = DateTime.now();
    //convert DateTime to String
    String deviceTimeHours = DateFormat('hmm').format(now);
    print(deviceTimeHours);
    //convert String DateTime to Int
    int deviceTimeInt = int.parse(deviceTimeHours);
    if (deviceTimeInt >= 328 && deviceTimeInt < 1157) {
      return currentPrayer = currentPray('Dhuhr');
    } else if (deviceTimeInt >= 1157 && deviceTimeInt < 1536) {
      return currentPrayer = currentPray('Asr');
    } else if (deviceTimeInt >= 1335 && deviceTimeInt < 1846) {
      return currentPrayer = currentPray('Maghrib');
    } else if (deviceTimeInt >= 1846 && deviceTimeInt < 2015) {
      return currentPrayer = currentPray('Isha');
    } else {
      return currentPrayer = currentPray('Fajr');
    }
  }
}
