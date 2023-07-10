import 'package:cap_stone_project/pages/daily_emotion_pages/daily_emotion.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future dialyEmotionDailog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          height: 390, // 변경 가능한 높이
          width: 340, // 변경 가능한 너비
          decoration: BoxDecoration(
            color: const Color(0xFF64B5F6),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 340,
                child: Lottie.asset(
                  'assets/dialog/circle_blue.json',
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                  ),
                  child: const DefaultTabController(
                      length: 2, child: DailyEmotion()),
                ),
              ),
            ],
          ),
          /*
          Lottie.asset(
            'assets/dialog/daily_dialog_background.json',
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
          */
        ),
      );
    },
  );
}
