import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.weatherapi.com/v1/';
  String apiKey = '79df5cfa03cf4041924180055242301';

  Future<WeatherModel> getWeather({required cityName}) async {
    String url =
        '${baseUrl}forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no';
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel(
        date: data['location']['localtime'],
        maxTemp: data['forecast']['forecastday'][0]['maxtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['mintemp_c'],
        temp: data['current']['temp_c'],
        weatherStateName: data['current']['condition']['text']);

    return weather;
  }
}
