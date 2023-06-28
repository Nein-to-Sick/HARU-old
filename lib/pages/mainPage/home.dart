import 'package:cap_stone_project/auth/auth.dart';
import 'package:cap_stone_project/model/mission.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/missonProvider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final missionProvider = Provider.of<MissionProvider>(context);
    final currentIndex = missionProvider.currentIndex;

    void missionComplete(BuildContext context, int index) {
      missionProvider.missionComplete(context, index);
    }

    final pages = List.generate(
        Mission().mission.length,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black12.withOpacity(0.025), // 피그마 색 다름 너무 연함
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SizedBox(
                height: 205,
                width: 290,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        Mission().mission[index][0],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Mission().mission[index][1],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Color(0xff717171)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: 113,
                          height: 33,
                          child: ElevatedButton(
                            onPressed: () {
                              missionComplete(context, index);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            child: const Text(
                              "성공!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                )),
              ),
            ));

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Text(
            "오늘의 미션",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 240,
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Text(
                          "${index + 1}/${pages.length}",
                          style: const TextStyle(
                              color: Color(0xff878787), fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        pages[index % pages.length],
                      ],
                    );
                  },
                  onPageChanged: (index) {
                    missionProvider.updateIndex(index);
                  },
                ),
                currentIndex != 0
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (currentIndex > 0) {
                              missionProvider.updateIndex(currentIndex - 1);
                              controller.animateToPage(
                                currentIndex - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xffE4E4E4),
                            size: 40,
                          ),
                        ))
                    : Container(),
                currentIndex != Mission().mission.length - 1
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            if (currentIndex < pages.length - 1) {
                              missionProvider.updateIndex(currentIndex + 1);
                              controller.animateToPage(
                                currentIndex + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xffE4E4E4),
                            size: 40,
                          ),
                        ))
                    : Container()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 230,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      "./assets/images/tree.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 클릭했을 때 실행될 코드
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: const Color(0xffA2D3FA),
                        shape: const CircleBorder(),
                      ),
                      child: SizedBox(
                        width: 68,
                        height: 68,
                        child: Image.asset(
                          "./assets/images/lamp.png",
                          scale: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12.withOpacity(0.025),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: Column(
                children: [
                  Text(
                    "\"나는 심심할때 창밖에 있는 새들을 봐\"",
                    style: TextStyle(color: Color(0xff717171)),
                  ),
                  Text("너는?", style: TextStyle(color: Color(0xff717171))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
