import 'package:cap_stone_project/mainPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff619F70),
        secondaryHeaderColor: const Color(0xffC2E3AD),
      ),
      home: const MainPage(),
    );
  }
}