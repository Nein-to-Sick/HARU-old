import 'package:cap_stone_project/components/button.dart';
import 'package:cap_stone_project/components/next_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    void signUserOut() {
      FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false);
    }

    print(progress / 20);
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"), actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: Column(
        children: [
          const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "오늘의 에너지는 어때?",
                style: TextStyle(fontSize: 30),
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "./assets/images/haru/${(progress / 20 + 1).round()}.png",
                  scale: 3,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      (progress / 20 + 1).round() == 1
                          ? "기분이 별로야.."
                          : (progress / 20 + 1).round() == 2
                              ? "오늘은 좀 피곤한 것 같아 ㅠㅠ"
                              : (progress / 20 + 1).round() == 3
                                  ? "글쎄? 모르겠어.."
                                  : (progress / 20 + 1).round() == 4
                                      ? "조금 신나는걸?"
                                      : (progress / 20 + 1).round() == 5
                                          ? "도전할게!"
                                          : "오늘은 뭐든지 하 수 있을 것만 같아!!",
                      style: const TextStyle(color: Color(0xff717171)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: AdvancedSeekBar(
                const Color(0xffeeeff3),
                15,
                Theme.of(context).primaryColor,
                lineHeight: 5,
                defaultProgress: 1,
                scaleWhileDrag: true,
                percentSplit: 5,
                percentSplitColor: Colors.black26,
                percentSplitWidth: 1,
                seekBarStarted: () {
                  setState(() {
                    state = "starting";
                  });
                },
                seekBarProgress: (v) {
                  setState(() {
                    state = " seeking";
                    progress = v;
                  });
                },
                seekBarFinished: (v) {
                  setState(() {
                    state = " finished";
                    progress = v;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          NextButton(
            onTap: () {},
            text: "저장",
            isSelected: true,
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
