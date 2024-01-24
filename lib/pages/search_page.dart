import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
        child: TextField(
          decoration: InputDecoration(
            label: Text('Search'),
            border: OutlineInputBorder(),
            hintText: 'Enter a city please',
            suffix: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                
              },
            ),
          ),
        ),
      ),
    );
  }
}
