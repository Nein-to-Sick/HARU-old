import 'package:cap_stone_project/components/button.dart';
import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/components/profile_widget.dart';
import 'package:cap_stone_project/pages/profilepage/profilesettings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import '../../auth/auth.dart';
import '../../components/advancedSeekBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String state = "";
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    void signUserOut() {
      FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false);
    }

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()));
            },
            icon: Icon(Icons.settings)),
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ProfileWidget(
                imagePath: user!.photoURL!,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              SizedBox(
                  width: 120,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.white),
                    child: Text(
                      "나의 미션",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
