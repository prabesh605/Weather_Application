import 'package:weather_new_design/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_new_design/UI/Home_Screen.dart';

class loading_Screen extends StatefulWidget {
  const loading_Screen({super.key});

  @override
  State<loading_Screen> createState() => _loading_ScreenState();
}

class _loading_ScreenState extends State<loading_Screen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Home_Screen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.green,
          size: 100.0,
        ),
      ),
    );
  }
}
