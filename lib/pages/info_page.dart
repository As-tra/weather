import 'package:flutter/material.dart';

class Meteo extends StatefulWidget {
  final data;
  const Meteo({super.key, this.data});

  @override
  State<Meteo> createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {
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
      body: Column(
        children: [
          Text('Location: ${widget.data['location']['name']}'),
          Text('Temputure: ${widget.data['current']['temp_c']}°C'),
          Text('condition: ${widget.data['current']['condition']['text']}'),
          Image(
              image: NetworkImage(
                  widget.data['current']['condition']['icon'].substring(2)))
        ],
      ),
    );
  }
}
