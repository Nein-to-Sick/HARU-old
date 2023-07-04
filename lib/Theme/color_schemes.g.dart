import 'package:flutter/material.dart';

class HARUTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    //  primary
    primary: HARUPrimary,
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDAD4),
    onPrimaryContainer: Color(0xFF3F0300),
    //  secondary
    secondary: HARUSecondary,
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFC2E8FF),
    onSecondaryContainer: Color(0xFF001E2B),
    //  tertiary
    tertiary: HARUTeritary,
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFCEE5FF),
    onTertiaryContainer: Color(0xFF001D32),
    //  error
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF490002),
    //  background
    background: Color(0xFFFAFDFD),
    onBackground: Color(0xFF191C1D),
    outline: Color(0xFF857370),
    onInverseSurface: Color(0xFFEFF1F1),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFFFFB4A6),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFA53B29),
    outlineVariant: Color(0xFFD8C2BE),
    scrim: Color(0xFF000000),
    surface: Color(0xFFF8FAFA),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFF5DDD9),
    onSurfaceVariant: Color(0xFF534340),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    //  primary
    primary: HARUPrimary,
    onPrimary: Color(0xFF640B02),
    primaryContainer: Color(0xFF842415),
    onPrimaryContainer: Color(0xFFFFDAD4),
    //  secondary
    secondary: HARUSecondary,
    onSecondary: Color(0xFF003548),
    secondaryContainer: Color(0xFF004D67),
    onSecondaryContainer: Color(0xFFC2E8FF),
    //  tertiary
    tertiary: HARUTeritary,
    onTertiary: Color(0xFF003353),
    tertiaryContainer: Color(0xFF004A75),
    onTertiaryContainer: Color(0xFFCEE5FF),
    //  error
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    outline: Color(0xFFA08C89),
    onInverseSurface: Color(0xFF191C1D),
    inverseSurface: Color(0xFFE1E3E3),
    inversePrimary: Color(0xFFA53B29),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFB4A6),
    outlineVariant: Color(0xFF534340),
    scrim: Color(0xFF000000),
    surface: Color(0xFF101415),
    onSurface: Color(0xFFC4C7C7),
    surfaceVariant: Color(0xFF534340),
    onSurfaceVariant: Color(0xFFD8C2BE),
  );

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
  });

  static const MaterialColor HARUSecondary = MaterialColor(0xffA2D5F2, {
    50: Color(0xffEFF4F8),
    100: Color(0xffCEDFEA),
    200: Color(0xffFFB2A1),
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
