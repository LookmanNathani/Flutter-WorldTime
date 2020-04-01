import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImg = data['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      appBar: AppBar(
        title: Text('World Clock'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 80, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    data['time'] = result['time'];
                    data['location'] = result['location'];
                    data['flag'] = result['flag'];
                    data['isDay'] = result['isDay'];
                  });
                },
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2.0,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 58.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
