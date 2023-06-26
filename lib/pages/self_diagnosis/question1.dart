import 'package:flutter/material.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          '안녕하세요 ~~님',
          style: TextStyle(fontSize: 30),
        ),
        Container(
          height: 20,
          width: 20,
          color: Colors.blue,
        ),
      ],
    );
  }
}
