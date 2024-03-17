import 'package:flutter/material.dart';

class DefaultHomePage extends StatelessWidget {
  const DefaultHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}