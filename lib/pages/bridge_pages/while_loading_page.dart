import 'package:cap_stone_project/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLoadingPage extends StatelessWidget {
  const MyLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void signUserOut() {
      FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
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
