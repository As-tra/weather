class WeatherModel {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String date;
  final String weatherStateName;

  WeatherModel(
      {required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.date,
      required this.weatherStateName});

  factory WeatherModel.fromJson(Map jsonData) {
    return WeatherModel(
        temp: jsonData['current']['temp_c'],
        maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
        date: jsonData['location']['localtime'],
        weatherStateName: jsonData['forecast']['forecastday'][0]['day']
            ['condition']['text']);
  }

  @override
  String toString() {
    return 'temp:$temp\nmaxTemp:$maxTemp\nminTemp:$minTemp\ndate:$date\nweatherSate:$weatherStateName';
  }
}
