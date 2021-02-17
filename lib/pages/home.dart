import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print("data is $data");

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
      child: Center(
        child: Column(
          children: [
            FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location' : result['location'],
                      'isDayTime' : result['isDayTime'],
                      'flag' : result['flag']
                    };
                  });
                },
                icon: Icon(Icons.location_on,
                color: Colors.black,),
                label: Text('Choose location')),
            Text(
              data['location'],
              style: TextStyle(fontSize: 21),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data['time'],
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
        ),
      ),
    );
  }
}
