// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_prodider.dart';

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
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
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName ?? '',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at ${weatherData!.date.hour}:${weatherData!.date.minute}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${Provider.of<WeatherProvider>(context).weatherData!.temp}',
                        style: TextStyle(fontSize: 30),
                      ),
                      Column(
                        children: [
                          Text('maxTemp:${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp:${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    // the ? say to the compiler don't try access the weatherData when it equal to Null
                    // weatherData?.weatherStateName ?? ''
                    weatherData!.weatherStateName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
    );
  }
}
