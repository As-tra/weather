class WeatherModel {
  double temp;
  double maxTemp;
  double minTemp;
  DateTime date;
  String weatherStateName;

  WeatherModel({
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.date,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(Map jsonData) {
    return WeatherModel(
      temp: jsonData['current']['temp_c'],
      maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      date: DateTime.parse(jsonData['location']['localtime']),
      weatherStateName: jsonData['forecast']['forecastday'][0]['day']
          ['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'temp:$temp\nmaxTemp:$maxTemp\nminTemp:$minTemp\ndate:$date\nweatherSate:$weatherStateName';
  }

  String getImage() {
    weatherStateName =
        weatherStateName[0].toUpperCase() + weatherStateName.substring(1);
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
