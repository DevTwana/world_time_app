import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String time;
  late String url;
  late String flag;
  late String location;
  late bool isDaytime;

  WorldTime({required this.url, required this.flag, required this.location});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String offset = data['utc_offset'].substring(1, 3);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat().add_jm().format(now);
      print('nowwwww');
      print(now.hour);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
