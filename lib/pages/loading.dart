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

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Iraq', flag: 'baghdad.png', url: 'Asia/Baghdad');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitSpinningLines(
      color: Colors.white,
      size: 50.0,
    );
    return Scaffold(
        backgroundColor: Colors.blue[900], body: const Center(child: spinkit));
  }
}
