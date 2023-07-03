import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future dialyEmotionDailog(BuildContext context) {
  return showDialog(
    //barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 300, // 변경 가능한 높이
          width: 300, // 변경 가능한 너비
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Lottie.asset(
            'assets/dialog/daily_dialog_background.json',
            height: 300, // 변경 가능한 높이
            width: 300,
          ),
        ),
      );
    },
  );
}
