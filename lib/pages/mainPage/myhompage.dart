import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('저금통')),
        body: const Center(child: CoinPiggyBank()),
      ),
    );
  }
}

class CoinPiggyBank extends StatefulWidget {
  const CoinPiggyBank({Key? key}) : super(key: key);

  @override
  _CoinPiggyBankState createState() => _CoinPiggyBankState();
}

class _CoinPiggyBankState extends State<CoinPiggyBank> {
  int _coins = 0;

  void _addCoin() {
    setState(() {
      _coins++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> piggyBankContent = [];

    for (int i = 0; i < _coins; i++) {
      double angle = 2 * 3.141592653589793 * i / _coins;
      double offsetX = 50 + 40 * cos(angle);
      double offsetY = 140 - 40 * (1 - sin(angle));
      piggyBankContent.add(
        Positioned(
          left: offsetX,
          top: offsetY,
          child: Container(
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _addCoin,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 150,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          ...piggyBankContent,
        ],
      ),
    );
  }
}
