import 'package:check/services/DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading ...';

  void setupDateTime() async {
    try {
      GetDateTime instance = GetDateTime(
          url: 'Asia/Kolkata', location: 'India', flag: 'india.jpg');
      await instance.getdata();
      // time = instance.time;
      print(instance.time);
      print(instance.isDay);
      setState(() {
        Navigator.pushReplacementNamed(context, '/Home', arguments: {
          'time': instance.time,
          'location': instance.location,
          'flag': instance.flag,
          'isDay' : instance.isDay
        });
      });
    } catch (e) {
      setState(() {
        time = 'Couldn\'t get time information';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
