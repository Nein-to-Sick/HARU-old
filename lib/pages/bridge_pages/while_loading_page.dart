import 'package:flutter/material.dart';

class MyLoadingPage extends StatelessWidget {
  const MyLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '안녕!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('assets/thecat.jpg'),
            width: 120,
            height: 146.9,
          ),
        ],
      ),
    );
  }
}
