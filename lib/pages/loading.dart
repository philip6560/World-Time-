import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time;
  Color bgColor;

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    setState(() {
      time = instance.time;
    });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welc',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 50.0,
              letterSpacing: 5.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          SpinKitRotatingCircle(
            color: Colors.blueGrey,
            size: 30.0,
          ),
          Text(
            'me',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 50.0,
              letterSpacing: 5.0,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}