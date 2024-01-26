import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            onSubmitted: (value) {
              cityName = value;
              WeatherService service = WeatherService();
              service.getWeather(cityName: cityName);
            },
            decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                label: const Text('Search'),
                border: const OutlineInputBorder(),
                hintText: 'Enter a city please',
                suffixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
