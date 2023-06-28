import 'package:cap_stone_project/auth/login_or_register.dart';
import 'package:cap_stone_project/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //user is logged in
            return HomePage();
          } else {
            //user is not logged in
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
