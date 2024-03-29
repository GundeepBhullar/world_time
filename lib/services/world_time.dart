

import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location = '';
  String time = '';
  String url = '';
  String flag = '';
  late bool isDaytime;
  WorldTime({required this.location, required this.url, required this.flag});



  Future<void> getData() async {


    try {

      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print('$datetime');
      // print('$offset');

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);


    }
    catch (e) {
      print(e);
      time = 'Could not get time at this moment !! please try later!!';
    }



  }

}