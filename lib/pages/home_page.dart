import 'package:flutter/material.dart';
import 'package:weather_app/pages/info_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApp extends StatelessWidget {
  final textController = TextEditingController();
  var data;

  Future<http.Response> getWeather(String location) {
    return http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=79df5cfa03cf4041924180055242301&q=$location'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'weather app',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        var response = await getWeather(textController.text);
                        if (response.statusCode == 200) {
                          data = json.decode(response.body);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Meteo(
                              data: data,
                            ),
                          ),
                        );
                      },
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Ya sa7bi Het Plasa makber rasek'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
