import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future dialyEmotionDailog(BuildContext context) {
  return showDialog(
    //barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: 390, // 변경 가능한 높이
          width: 340, // 변경 가능한 너비
          decoration: BoxDecoration(
            color: const Color(0xFF64B5F6),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Stack(
            children: [
              Container(
                height: 390, // 변경 가능한 높이
                width: 340,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 250),
                  child: Lottie.asset(
                    'assets/dialog/circle_blue.json',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  height: 200,
                  width: 340,
                  color: Colors.white,
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
