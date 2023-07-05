import 'package:weather_new_design/location.dart';
import 'package:weather_new_design/networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather?';
const apiKey = "0b10461d5a30e6612ce19d84c97ef651";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "${openWeatherMapURL}q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '${openWeatherMapURL}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherCondition(int condition) {
    if (condition >= 200 && condition < 300) {
      return '⛈️ Thunderstorm';
    } else if (condition >= 300 && condition < 400) {
      return '🌧️ Drizzle';
    } else if (condition >= 500 && condition < 600) {
      return '🌧️ Rain';
    } else if (condition >= 600 && condition < 700) {
      return '❄️ Snow';
    } else if (condition >= 700 && condition < 800) {
      return '🌫️ Atmosphere';
    } else if (condition == 800) {
      return '☀️ Clear';
    } else if (condition >= 801 && condition < 900) {
      return '☁️ Clouds';
    } else {
      return 'Weather condition not found';
    }
  }

  String getWeatherImage(int condition) {
    if (condition >= 200 && condition < 300) {
      return 'images/thunderstorm.jpg';
    } else if (condition >= 300 && condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition >= 500 && condition < 600) {
      return 'images/rain.jpg';
    } else if (condition >= 600 && condition < 700) {
      return 'images/snow.jpg';
    } else if (condition >= 700 && condition < 800) {
      return 'images/atmosphere.jpg';
    } else if (condition == 800) {
      return 'images/clear.jpg';
    } else if (condition >= 801 && condition < 900) {
      return 'images/clouds.jpg';
    } else {
      return 'images/clear.jpg';
    }
  }

  String getWeatherDescription(int condition) {
    if (condition == 200) {
      return '⛈️ Thunderstorm with light rain';
    } else if (condition == 201) {
      return '⛈️ Thunderstorm with rain';
    } else if (condition == 202) {
      return '⛈️ Thunderstorm with heavy rain';
    } else if (condition == 210) {
      return '⛈️ Light thunderstorm';
    } else if (condition == 211) {
      return '⛈️ Thunderstorm';
    } else if (condition == 212) {
      return '⛈️ Heavy thunderstorm';
    } else if (condition == 221) {
      return '⛈️ Ragged thunderstorm';
    } else if (condition == 230) {
      return '⛈️ Thunderstorm with light drizzle';
    } else if (condition == 231) {
      return '⛈️ Thunderstorm with drizzle';
    } else if (condition == 232) {
      return '⛈️ Thunderstorm with heavy drizzle';
    } else if (condition == 300) {
      return '🌧️ Light intensity drizzle';
    } else if (condition == 301) {
      return '🌧️ Drizzle';
    } else if (condition == 302) {
      return '🌧️ Heavy intensity drizzle';
    } else if (condition == 310) {
      return '🌧️ Light intensity drizzle rain';
    } else if (condition == 311) {
      return '🌧️ Drizzle rain';
    } else if (condition == 312) {
      return '🌧️ Heavy intensity drizzle rain';
    } else if (condition == 313) {
      return '🌧️ Shower rain and drizzle';
    } else if (condition == 314) {
      return '🌧️ Heavy shower rain and drizzle';
    } else if (condition == 321) {
      return '🌧️ Shower drizzle';
    } else if (condition == 500) {
      return '🌧️ Light rain';
    } else if (condition == 501) {
      return '🌧️ Moderate rain';
    } else if (condition == 502) {
      return '🌧️ Heavy intensity rain';
    } else if (condition == 503) {
      return '🌧️ Very heavy rain';
    } else if (condition == 504) {
      return '🌧️ Extreme rain';
    } else if (condition == 511) {
      return '🌧️ Freezing rain';
    } else if (condition == 520) {
      return '🌧️ Light intensity shower rain';
    } else if (condition == 521) {
      return '🌧️ Shower rain';
    } else if (condition == 522) {
      return '🌧️ Heavy intensity shower rain';
    } else if (condition == 531) {
      return '🌧️ Ragged shower rain';
    } else if (condition == 600) {
      return '❄️ Light snow';
    } else if (condition == 601) {
      return '❄️ Snow';
    } else if (condition == 602) {
      return '❄️ Heavy snow';
    } else if (condition == 611) {
      return '❄️ Sleet';
    } else if (condition == 612) {
      return '❄️ Light shower sleet';
    } else if (condition == 613) {
      return '❄️ Shower sleet';
    } else if (condition == 615) {
      return '❄️ Light rain and snow';
    } else if (condition == 616) {
      return '❄️ Rain and snow';
    } else if (condition == 620) {
      return '❄️ Light shower snow';
    } else if (condition == 621) {
      return '❄️ Shower snow';
    } else if (condition == 622) {
      return '❄️ Heavy shower snow';
    } else if (condition == 701) {
      return '🌫️ Mist';
    } else if (condition == 711) {
      return '🌫️ Smoke';
    } else if (condition == 721) {
      return '🌫️ Haze';
    } else if (condition == 731) {
      return '🌫️ Dust';
    } else if (condition == 741) {
      return '🌫️ Fog';
    } else if (condition == 751) {
      return '🌫️ Sand';
    } else if (condition == 761) {
      return '🌫️ Dust';
    } else if (condition == 762) {
      return '🌫️ Ash';
    } else if (condition == 771) {
      return '🌪️ Squalls';
    } else if (condition == 781) {
      return '🌪️ Tornado';
    } else if (condition == 800) {
      return '☀️ Clear sky';
    } else if (condition == 801) {
      return '🌤️ Few clouds: 11-25%';
    } else if (condition == 802) {
      return '⛅ Scattered clouds: 25-50%';
    } else if (condition == 803) {
      return '🌥️ Broken clouds: 51-84%';
    } else if (condition == 804) {
      return '☁️ Overcast clouds: 85-100%';
    } else {
      return 'Weather condition not found';
    }
  }
}
