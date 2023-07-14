import 'package:cap_stone_project/pages/missionCommunity/missionReview.dart';
import 'package:flutter/material.dart';

import '../model/mission.dart';

class MissionProvider extends ChangeNotifier {
  int currentIndex = 0;
  int face = 0;
  double height = 260;

  List<List<String>> mission = [];

  Future<List<List<String>>> fetchMission() async {
    Mission missionModel = Mission();
    mission = await missionModel.fetchMission();
    notifyListeners();
    return mission;
  }

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void updateContent(int faceIndex, BuildContext context) {
    face = faceIndex;
    //notifyListeners();
    // final snackbar = SnackBar(content: Text("저장되었습니다."));
    // ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void updateHeight(double hei) {
    height = hei;
    notifyListeners();
  }

  void missionComplete(BuildContext context, List<String> mission) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    const Text(
                      "축하해!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "미션을 훌륭히 완료했구나!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Image.asset(
                      "./assets/images/haru.png",
                      scale: 2,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MissionReview(mission: mission)));
                      },
                      child: const Text("후기 남기러 가기",
                          style: TextStyle(
                            color: Color(0xFF878787),
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff64B5F6)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "완료",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

// void missionComplete(BuildContext context, int missionIndex) {
//   final text1Controller = TextEditingController();
//   final text2Controller = TextEditingController();
//   final text3Controller = TextEditingController();
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       face = 0;
//       height = 260;
//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             content: SizedBox(
//               width: 337,
//               height: height,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         face == 0
//                             ? const SizedBox(
//                                 height: 20,
//                               )
//                             : const SizedBox(
//                                 height: 20,
//                               ),
//                         face != 0 && height == 400
//                             ? Image.asset(
//                                 "./assets/images/face$face.png",
//                                 scale: 2,
//                               )
//                             : Container(),
//                         face == 0
//                             ? const Text(
//                                 '(와 끝낸거야? 대박)',
//                                 style: TextStyle(
//                                   color: Color(0xff717171),
//                                   fontSize: 15,
//                                 ),
//                               )
//                             : Container(),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         face == 5
//                             ? const Text(
//                                 "이번 미션은 정말 재밌었구나!\n너가 좋았다니 나도 행복한데?",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             : const Text(
//                                 "어땠어? 간단하게 알려줄래?",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         height == 400
//                             ? Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15.0, right: 15.0),
//                                 child: Column(
//                                   children: [
//                                     TextField(
//                                       controller: text1Controller,
//                                       decoration: InputDecoration(
//                                           focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                             color: Theme.of(context)
//                                                 .primaryColor,
//                                             width: 1.0,
//                                           )),
//                                           hintText: "뭐가 제일 기억에 남아?"),
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     TextField(
//                                       controller: text2Controller,
//                                       decoration: InputDecoration(
//                                           focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                             color: Theme.of(context)
//                                                 .primaryColor,
//                                             width: 1.0,
//                                           )),
//                                           hintText: "싫었던건 없어?"),
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     TextField(
//                                       controller: text3Controller,
//                                       decoration: InputDecoration(
//                                           focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                             color: Theme.of(context)
//                                                 .primaryColor,
//                                             width: 1.0,
//                                           )),
//                                           hintText: "마지막으로 하고 싶은 말!"),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(),
//                       ],
//                     ),
//                   ),
//                   height != 400
//                       ? Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   updateContent(1, context);
//                                 });
//                               },
//                               child: face == 1
//                                   ? Image.asset(
//                                       "./assets/images/face1.png",
//                                       scale: 2,
//                                     )
//                                   : Image.asset(
//                                       "./assets/images/face1_g.png",
//                                       scale: 2,
//                                     ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   updateContent(2, context);
//                                 });
//                               },
//                               child: face == 2
//                                   ? Image.asset(
//                                       "./assets/images/face2.png",
//                                       scale: 2,
//                                     )
//                                   : Image.asset(
//                                       "./assets/images/face2_g.png",
//                                       scale: 2,
//                                     ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   updateContent(3, context);
//                                 });
//                               },
//                               child: face == 3
//                                   ? Image.asset(
//                                       "./assets/images/face3.png",
//                                       scale: 2,
//                                     )
//                                   : Image.asset(
//                                       "./assets/images/face3_g.png",
//                                       scale: 2,
//                                     ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   updateContent(4, context);
//                                 });
//                               },
//                               child: face == 4
//                                   ? Image.asset(
//                                       "./assets/images/face4.png",
//                                       scale: 2,
//                                     )
//                                   : Image.asset(
//                                       "./assets/images/face4_g.png",
//                                       scale: 2,
//                                     ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   updateContent(5, context);
//                                 });
//                               },
//                               child: face == 5
//                                   ? Image.asset(
//                                       "./assets/images/face5.png",
//                                       scale: 2,
//                                     )
//                                   : Image.asset(
//                                       "./assets/images/face5_g.png",
//                                       scale: 2,
//                                     ),
//                             ),
//                           ],
//                         )
//                       : Container(),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   face != 0 && height != 400
//                       ? TextButton(
//                           onPressed: () {
//                             setState(() {
//                               updateHeight(400);
//                             });
//                           },
//                           child: const Text(
//                             "더 알려줄래?",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         )
//                       : height != 400
//                           ? const SizedBox(
//                               height: 86,
//                             )
//                           : Container(),
//                   face != 0 && height != 400
//                       ? SizedBox(
//                           width: 113,
//                           height: 38,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               DatabaseService().missionEmotion(
//                                   face, missionIndex, "", "", "");
//                               Navigator.pop(context);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               backgroundColor: Theme.of(context).primaryColor,
//                             ),
//                             child: const Text(
//                               "완료",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         )
//                       : height == 400
//                           ? SizedBox(
//                               width: 240,
//                               height: 45,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   DatabaseService().missionEmotion(
//                                       face,
//                                       missionIndex,
//                                       text1Controller.text,
//                                       text2Controller.text,
//                                       text3Controller.text);
//                                   Navigator.pop(context);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   backgroundColor:
//                                       Theme.of(context).primaryColor,
//                                 ),
//                                 child: const Text(
//                                   "완료",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
}
