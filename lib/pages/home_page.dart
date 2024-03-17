import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/pages/default_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/success_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'weather app',
          style: TextStyle(
              // color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          return ShowDataWidget(cityName: state.cityName,weatherData: state.weatherData,);
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text(
              'Somethign went wrong please try again',
            ),
          );
        } else {
          return const DefaultHomePage();
        }
      }),
    );
  }
}