import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            onChanged: (value) => cityName = value,
            onSubmitted: (value) async {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                label: const Text('Search'),
                border: const OutlineInputBorder(),
                hintText: 'Enter a city please',
                suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search),
                )),
          ),
        ),
      ),
    );
  }
}
