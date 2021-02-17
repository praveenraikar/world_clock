import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  String time;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      // print(response.body);
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 15 && now.hour < 20 ? true : false;
      // time = now.toString();
      print('Current time is');
      time = DateFormat.jm().format(now).toString();
      print("Time is $time");
    } catch (exception) {
      print(exception);
      time = "Error parsing";
    }
  }
}
