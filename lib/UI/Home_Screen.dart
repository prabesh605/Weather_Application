import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:weather_new_design/weather.dart';
import 'package:weather_new_design/City_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key, this.locationWeather});
  final locationWeather;

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  int? condition;
  String? cityName;
  String? weatherImage;
  String? weatherMessageDetail;
  int? humidity;
  double? wind;
  String? weatherMessage;
  int? pressure;
  String? matchingColor;
  Color? textColor;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = "null";
        pressure = 0;
        humidity = 0;
        wind = 0;
        weatherImage = "images/rain.jpg";
        weatherMessage = " Error";
        weatherMessageDetail = "Error";
        return;
      }
      double temp = weatherData["main"]['temp'];
      temperature = temp.toInt();
      pressure = weatherData['main']['pressure'];
      wind = weatherData['wind']['speed'];
      var condition = weatherData['weather'][0]["id"];
      weatherImage = weather.getWeatherImage(condition);
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];

      weatherMessage = weather.getWeatherCondition(condition);

      weatherMessageDetail = weather.getWeatherDescription(condition);
      if (weatherImage == 'images/thunderstorm.jpg' ||
          weatherImage == 'images/rain.jpg') {
        textColor = Colors.white;
      } else {
        textColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("$weatherImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: const Icon(
                          Icons.near_me,
                          size: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          var typedName = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return city_Screen();
                          }));
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: const Icon(
                          Icons.location_city,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 22.0),
                        child: Text(
                          '$cityName',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: textColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "$temperature",
                              style: TextStyle(
                                  fontSize: 190.0,
                                  color: textColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 100.0),
                            child: Text(
                              "°C",
                              style:
                                  TextStyle(fontSize: 40.0, color: textColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        '$weatherMessage',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "$weatherMessageDetail",
                style: TextStyle(
                    fontSize: 25.0,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 200.0,
            ),
            Container(
              height: 100.0,
              width: 380.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue.withOpacity(0.1),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "$humidity%",
                          style: kNormalStyle,
                        ),
                        const Text(
                          "Humidity",
                          style: kNormalTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 80.0,
                      width: 1.0,
                      decoration: BoxDecoration(
                        color: sgreyColor.withOpacity(0.5),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${wind}m/s",
                          style: kNormalStyle,
                        ),
                        const Text(
                          "Wind/Speed",
                          style: kNormalTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 80.0,
                      width: 1.0,
                      decoration: BoxDecoration(
                        color: sgreyColor.withOpacity(0.5),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${pressure}hpa",
                          style: kNormalStyle,
                        ),
                        const Text(
                          "Pressure",
                          style: kNormalTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
