import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setupWorldTime() async
   {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    await instance.getTime();

    print(instance.time);

    setState(() {
      time = instance.time;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState function ran');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
