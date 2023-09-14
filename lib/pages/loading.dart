import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setupWorldTime()  async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
     await instance.getTime();
    print('test3');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    print('test2');
    setupWorldTime();
    print('test4');
  }

  @override
  Widget build(BuildContext context) {
    print('test1');
    const spinkit = SpinKitSpinningLines(
      color: Colors.white,
      size: 50.0,
    );
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body:  const Center(
        child:spinkit
      )
    );
  }
}
