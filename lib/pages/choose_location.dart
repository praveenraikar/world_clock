import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'london.jpeg'),

    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpeg')
  ];

  void updateTime (index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime' : worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
