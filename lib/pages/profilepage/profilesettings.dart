import 'package:cap_stone_project/components/button.dart';
import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/components/profile_widget.dart';
import 'package:cap_stone_project/pages/profilepage/alarmpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import '../../auth/auth.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ProfileWidget(
                imagePath: user!.photoURL!,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              Text(
                user!.displayName!,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                  child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: Theme.of(context).colorScheme.outline),
                child: Text(
                  "프로필 편집",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              )),
              const SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AlarmPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Theme.of(context).colorScheme.outline),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "알림 설정",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Theme.of(context).colorScheme.outline),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "계정 관리",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 15),
              SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Theme.of(context).colorScheme.outline),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "이용 약관",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 15),
              SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.1,
                  child: ElevatedButton(
                    onPressed: signUserOut,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Theme.of(context).colorScheme.outline),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "로그아웃",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
