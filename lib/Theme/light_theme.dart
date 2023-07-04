import 'package:flutter/material.dart';

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
    primary: HARUThemelight.HARUPrimary,
    secondary: HARUThemelight.HARUSecondary,
    tertiary: Color(0xFFE4E4E4), //  Unselected Color
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
);

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
    primary: Color(0xFF619F70),
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
*/

class HARUThemelight {
  static const MaterialColor HARUPrimary = MaterialColor(0xffFF7E67, {
    900: Color(0xff692016),
    800: Color(0xff892A1E),
    700: Color(0xffA7382A),
    600: Color(0xffC34A39),
    500: Color(0xffDA604C),
    400: Color(0xffED7A64),
    300: Color(0xffFB9581),
    200: Color(0xffFFB2A1),
    100: Color(0xffFFD0C5),
    50: Color(0xffFFEFEB),
    0: Color(0xffFF7E67),
  });

  static const MaterialColor HARUSecondary = MaterialColor(0xffA2D5F2, {
    50: Color(0xffEFF4F8),
    100: Color(0xffCEDFEA),
    200: Color(0xffAFCADB),
    300: Color(0xff91B6CB),
    400: Color(0xff74A1BA),
    500: Color(0xff5B8DA7),
    600: Color(0xff447892),
    700: Color(0xff32647C),
    800: Color(0xff255065),
    900: Color(0xff1C3D4D)
  });

  static const MaterialColor HARUTeritary = MaterialColor(0xff07679F, {
    50: Color(0xffEEF4FC),
    100: Color(0xffCEDFEA),
    200: Color(0xffAAC9EF),
    300: Color(0xff89B4E4),
    400: Color(0xff68A0D7),
    500: Color(0xff488BC5),
    600: Color(0xff2B77B0),
    700: Color(0xff106398),
    800: Color(0xff004F7C),
    900: Color(0xff053C5F)
  });

  static const MaterialColor HARUGreyscale = MaterialColor(0xffF9F9F9, {
    0: Color(0xffFFFFFF),
    25: Color(0xffFAFAFA),
    50: Color(0xffF3F3F3),
    100: Color(0xffDDDDDD),
    200: Color(0xffC6C6C6),
    300: Color(0xffB0B0B0),
    400: Color(0xff9B9B9B),
    500: Color(0xff868686),
    600: Color(0xff727272),
    700: Color(0xff5E5E5E),
    800: Color(0xff4B4B4B),
    900: Color(0xff393939)
  });
}
