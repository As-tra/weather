import 'package:http/http.dart' as http;

class WeatherService {
  void getWeather({required cityName}) async {
    // you reach video 14
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=79df5cfa03cf4041924180055242301&q=London&aqi=no'));
  }
}
