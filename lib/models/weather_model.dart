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
}
