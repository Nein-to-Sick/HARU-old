import 'package:flutter/material.dart';

/*
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFAFAFA),
    primary: Color(0xFFFF7E67),
    secondary: Color(0xFFA2D5F2),
    tertiary: Color(0xFFE4E4E4), //  Unselected Color
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
);
*/

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFAFAFA),
    primary: Color(0xFF619F70),
    //primary: HSLColor.fromColor(),
    secondary: Color(0xFFC2E3AD),
    tertiary: Color(0xFFE4E4E4), //  Unselected Color
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
);
