import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_prodider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => WeatherProvider(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          cardColor: Colors.grey[200],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}
