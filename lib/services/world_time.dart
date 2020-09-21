import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //thi time in that location
  String flag; //url to an asset flag icon
  String url; //location url for the api endpoint
  bool isDayTime; //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print(datetime);
      //print(offset);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? false : true;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caugh error: $e');
      time = 'could not get time data';
    }
  }
}
