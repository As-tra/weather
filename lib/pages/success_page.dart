import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class ShowDataWidget extends StatelessWidget {
  final WeatherModel weatherData;
  final String cityName;
  const ShowDataWidget({
    super.key,
    required this.weatherData,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.green.shade300,
          Colors.green.shade100,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherData.date.hour}:${weatherData.date.minute}',
            style: const TextStyle(fontSize: 22),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(weatherData.getImage()),
              Text(
                '${weatherData.temp}',
                style: const TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text('maxTemp:${weatherData.maxTemp.toInt()}'),
                  Text('minTemp:${weatherData.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            // the ? say to the compiler don't try access the weatherData when it equal to Null
            // weatherData?.weatherStateName ?? ''
            weatherData.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
