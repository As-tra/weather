import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(super.initialState, this.weatherService);
  WeatherService weatherService;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    WeatherModel? weather = await weatherService.getWeather(cityName: cityName);
    if (weather != null) {
      emit(WeatherSuccess(weatherData: weather!,cityName: cityName));
    } else {
      emit(WeatherFailure());
    }
  }
}
