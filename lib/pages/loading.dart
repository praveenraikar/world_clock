import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading...';
  void setUpWorldTime() async {

    await Future.delayed(Duration(seconds: 3),(){

    });
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime' : worldTime.isDayTime
    });
    // setState(() {
    //   time = worldTime.time;
    // });
    // print(worldTime);
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.blue,
     body: Center(
       child: SpinKitDoubleBounce(
         color: Colors.white70,
         size: 50.0,
       ),
     ),
   );
  }
}
