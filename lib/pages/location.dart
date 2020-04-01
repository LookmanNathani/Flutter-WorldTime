import 'package:flutter/material.dart';
import 'package:check/services/DateTime.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<GetDateTime> locations = [
    GetDateTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    GetDateTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    GetDateTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    GetDateTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    GetDateTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    GetDateTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    GetDateTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    GetDateTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    GetDateTime(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void updateTime(index) async {
    GetDateTime instance = locations[index];
    await instance.getdata();
    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDay': instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
