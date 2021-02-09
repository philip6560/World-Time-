import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
  String time; // the time in the location
  String url; // location url for API endpoint
  String flag; // url to an asset flag icon
  bool isDaytime; // determinant of the hour of the day

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
      // make request
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      time = 'could not get time data';
    }


  }

}