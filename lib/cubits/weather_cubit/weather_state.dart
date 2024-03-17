import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherData;
  String cityName;

  WeatherSuccess({required this.weatherData,required this.cityName});
}

class WeatherFailure extends WeatherState {}
