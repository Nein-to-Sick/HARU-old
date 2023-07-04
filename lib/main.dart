import 'package:cap_stone_project/Theme/color_schemes.g.dart';
import 'package:cap_stone_project/Theme/dark_theme.dart';
import 'package:cap_stone_project/Theme/light_theme.dart';
import 'package:cap_stone_project/auth/auth.dart';
import 'package:cap_stone_project/pages/mainPage/mainPage.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true, colorScheme: HARUTheme.lightColorScheme),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: HARUTheme.darkColorScheme),
      // theme: lightTheme,
      // darkTheme: darkTheme,
      home: const AuthPage(),
    );
  }
}
