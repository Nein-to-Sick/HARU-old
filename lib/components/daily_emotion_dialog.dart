import 'package:cap_stone_project/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../안쓰는 페이지/advancedSeekBar.dart';

List<String> emotion = [
  "행복",
  "기쁨",
  "흥분",
  "평온",
  "덤덤",
  "답답",
  "우울",
  "분노",
  "짜증",
  "슬픔"
];

Future dialyEmotionDailog(BuildContext context) {
  int step = 1;
  String state = "";
  int progress = 0;
  double height = 300;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  bool _isSaveButtonEnabled = false;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        void _checkForSaveButton() {
          setState(() {
            _isSaveButtonEnabled = titleController.text.isNotEmpty &&
                contentController.text.isNotEmpty;
          });
        }

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            height: height, // 변경 가능한 높이
            width: 340, // 변경 가능한 너비
            decoration: BoxDecoration(
              color: const Color(0xFF64B5F6),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            step == 1
                                ? Text(
                                    "(안녕?)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.HARUGreyscale[50]),
                                  )
                                : step == 2
                                    ? const Text(
                                        "행복하구나?",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "현재 감정을 기록해볼래?",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                            step == 1
                                ? const Text(
                                    "너의 지금 기분은 어때?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : step == 2
                                    ? const Text(
                                        "1부터 10까지, 얼마나 행복해?",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container()
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 340,
                      child: Lottie.asset(
                        'assets/dialog/circle_blue.json',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
                step == 1
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25.0, left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: GridView.count(
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 1.0,
                              childAspectRatio: 0.9,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 5,
                              children: List.generate(
                                10,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        step = 2;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 45,
                                          height: 45,
                                          child: Image.asset(
                                            "./assets/images/emotion/${index + 1}.png",
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            emotion[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : step == 2
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 50.0, left: 10, right: 10),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: AdvancedSeekBar(
                                        const Color(0xffeeeff3),
                                        15,
                                        AppColors.primaryColor,
                                        lineHeight: 5,
                                        defaultProgress: 0,
                                        scaleWhileDrag: true,
                                        percentSplit: 9,
                                        percentSplitColor: Colors.black26,
                                        percentSplitWidth: 1,
                                        fillProgress: true,
                                        autoJump2Split: true,
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
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          step = 3;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.HARUPrimary),
                                      child: const Text(
                                        "감정 기록하기",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff64B5F6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        child: Text(
                                          "완료",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: MediaQuery.of(context).size.height *
                                      0.12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: titleController,
                                    onChanged: (text) {
                                      _checkForSaveButton();
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "제목",
                                        hintStyle: TextStyle(
                                            color: Color(0xffBDBDBD),
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: TextField(
                                        controller: contentController,
                                        onChanged: (text) {
                                          _checkForSaveButton();
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "내용",
                                          hintStyle: TextStyle(
                                              color: Color(0xffBDBDBD),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            SnackBar snackBar = SnackBar(
                                              content: Text('저장되었습니다!'),
                                              action: SnackBarAction(
                                                label: '보러가기',
                                                onPressed: () {},
                                              ),
                                            );

                                            // SnackBar 표시
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          child: const Text(
                                            "건너뛰기",
                                            style: TextStyle(
                                                color: Color(0xff717171),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      ElevatedButton(
                                        onPressed: _isSaveButtonEnabled
                                            ? () {
                                                Navigator.pop(context);
                                                SnackBar snackBar = SnackBar(
                                                  content: Text('저장되었습니다!'),
                                                  action: SnackBarAction(
                                                    label: '보러가기',
                                                    onPressed: () {},
                                                  ),
                                                );

                                                // SnackBar 표시
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff64B5F6),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 3, 15, 3),
                                          child: Text(
                                            "저장",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
              ],
            ),
          ),
        );
      });
    },
  );
}
