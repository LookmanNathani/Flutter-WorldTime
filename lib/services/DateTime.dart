import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetDateTime{

  String location;
  String url;
  String flag;
  String time;
  bool isDay;

  GetDateTime({this.url, this.location, this.flag});
  Future<void> getdata() async{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    now = now.add(Duration(minutes: int.parse(offset2)));

    time = DateFormat.jm().format(now);
    isDay = now.hour>=6 && now.hour<20 ? true : false;
  }
}