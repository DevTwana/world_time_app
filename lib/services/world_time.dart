import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String time;
  late String url;
  late String flag;
  late String location;

  WorldTime({ required this.url, required this.flag, required this.location});

  Future<void> getTime() async {
    try{
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String offset = data['utc_offset'].substring(1, 3);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // time = now.toString();
      time = DateFormat().add_jm().format(now);
      print(time);
    }catch (e){
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}



