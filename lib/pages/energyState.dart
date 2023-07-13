import 'package:cap_stone_project/pages/mainPage/mainPage.dart';
import 'package:cap_stone_project/services/database_service.dart';
import 'package:flutter/material.dart';
import '../components/advancedSeekBar.dart';
import '../components/next_button.dart';

class EnergyState extends StatefulWidget {
  const EnergyState({Key? key}) : super(key: key);

  @override
  State<EnergyState> createState() => _EnergyStateState();
}

class _EnergyStateState extends State<EnergyState> {
  String state = "";
  int progress = 0;

  List<ImageProvider> imageProviders = [];

  @override
  void initState() {
    super.initState();
    preloadImages();
  }

  void preloadImages() {
    for (int i = 1; i <= 6; i++) {
      imageProviders.add(AssetImage("./assets/images/haru/$i.png"));
    }
  }

  @override
  Widget build(BuildContext context) {
    preloadImages();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 130,
          ),
          const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "오늘의 에너지는 어때?",
                style: TextStyle(fontSize: 30),
              )),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                width: 251,
                height: 251,
                image: imageProviders[(progress / 20 + 1).round() - 1],
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
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 100),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
          const SizedBox(
            height: 120,
          ),
          NextButton(
            onTap: () {
              DatabaseService().storeState((progress / 20 + 1).round());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false);
            },
            text: "저장",
            isSelected: true,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
